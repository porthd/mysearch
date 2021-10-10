<?php

namespace Porthd\Mysearchext\Elasticsearch\Indexer;

// https://dev.to/dendihandian/elasticsearch-in-laradock-nm4 URI for elastic depends to the port 9200 (default)
use Elasticsearch\Common\Exceptions\BadRequest400Exception;
use Porthd\Mysearchext\Config\SelfConst;
use Porthd\Mysearchext\Domain\Model\DataDocumentInterface;


class BasicIndexer implements IndexerInterface
{

    protected const SELF_NAME = 'Porthd_Mysearchext_BasicIndexer';

    protected $errormessages = [];

    protected $urls = [];

    protected $elasticSearch = [];

    function __construct()
    {
        $domain = getenv('DOMAIN_NAME') ?? SelfConst::SELF_DOMAIN_NAME;
        $addPort = getenv('DOMAIN_ELASTIC_ADDPORT') ?? SelfConst::SELF_DOMAIN_ELASTIC_ADDPORT;
        $this->elasticSearch = \Elasticsearch\ClientBuilder::create()
            ->setHosts([$domain . $addPort])
            ->build();
    }

    public function selfName():string
    {
        return self::SELF_NAME;
    }

    /**
     * @return DataDocumentInterface|null
     */
    public function makeDataModelExtend():?DataDocumentInterface
    {
        return new \Porthd\Mysearchext\Domain\Model\BasicData();
    }

    public function getUrls(array &$requestData):array
    {
        return $this->urls;
    }

    public function getNeededRawData():array
    {
        return SelfConst::BASIC_REQUEST_KEY_LIST;
    }

    public function normalizeRequest(array &$requestData):bool
    {
        return true;
    }
    public function rebuildRequest(array &$requestData):bool
    {
        if (!empty($requestData['links'])) {
            $this->urls = $requestData['links'];
        }
        return true;
    }

    public function getErrorMessages():array
    {
        return $this->errormessages;
    }

    public function addErrorMessage(string $message):void
    {
        $this->errormessages[] = $message;
    }

    public function buildAndInsert(array &$requestData):bool
    {
        return true;
    }

    public function indexName(array &$dataForIndex):?string
    {
        return null;
    }
    public function typeName(array &$dataForIndex):?string
    {
        return null;
    }
    public function idName(array &$dataForIndex):?string
    {
        return null;
    }
    public function bodyList(array &$dataForIndex):array
    {
        return $dataForIndex;
    }

    public function insert($indexParam){
        try{
            // Alles hat geklappt
            return $this->elasticSearch->index($indexParam);
        } catch (BadRequest400Exception $e) {
            // Speichern fehlgeschlagen
            return false;
        }
    }

}
