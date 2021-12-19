<?php

namespace Porthd\Mysearchext\Elasticsearch\Indexer;

// https://dev.to/dendihandian/elasticsearch-in-laradock-nm4 URI for elastic depends to the port 9200 (default)
use Elasticsearch\Common\Exceptions\BadRequest400Exception;
use Elasticsearch\Common\Exceptions\Missing404Exception;
use Exception;
use Porthd\Mysearchext\Config\SelfConst;
use Porthd\Mysearchext\Domain\Model\DataDocumentInterface;


class BasicIndexer implements IndexerInterface
{

    protected const SELF_NAME = 'Porthd_Mysearchext_BasicIndexer';

    /** @var array $errormessages */
    protected $errormessages = [];

    /** @var array $urls */
    protected $urls = [];

    /** @var array|\Elasticsearch\Client $elasticSearch */
    protected $elasticSearch = [];

    /**
     * initialive with some .env-variables
     */
    function __construct()
    {
        $domain = getenv('DOMAIN_NAME') ?? SelfConst::SELF_DOMAIN_NAME;
        $addPort = getenv('DOMAIN_ELASTIC_ADDPORT') ?? SelfConst::SELF_DOMAIN_ELASTIC_ADDPORT;
        $this->elasticSearch = \Elasticsearch\ClientBuilder::create()
            ->setHosts([$domain . $addPort])
            ->build();
    }

    /**
     * @return string
     */
    public function selfName():string
    {
        return self::SELF_NAME;
    }

    /**
     * @param array $data
     */
    public function makeDataModelExtend(array &$data):void
    {

    }

    /**
     * @param array $requestData
     * @return array
     */
    public function getUrls(array &$requestData):array
    {
        return []; // don't give any URLs back for next browsing/indexing-step
    }

    /**
     * @return array
     */
    public function getNeededRawData():array
    {
        return SelfConst::BASIC_REQUEST_KEY_LIST;
    }

    /**
     * @param array $requestData
     * @return bool
     */
    public function normalizeRequest(array &$requestData):bool
    {
        return true;
    }

    /**
     * @param array $requestData
     * @return bool
     */
    public function rebuildRequest(array &$requestData):bool
    {
        if (!empty($requestData[SelfConst::ADDON_BASIC_LINKS])) {
            $this->urls = $requestData[SelfConst::ADDON_BASIC_LINKS];
        }
        return true;
    }

    /**
     * @return array
     */
    public function getErrorMessages():array
    {
        return $this->errormessages;
    }

    /**
     * @param string $message
     */
    public function addErrorMessage(string $message):void
    {
        $this->errormessages[] = $message;
    }

    /**
     * @param array $requestData
     * @return bool
     */
    public function buildAndInsert(array &$requestData):bool
    {
        return true;
    }

    /**
     * @param array $data
     * @return string|null
     */
    public function indexName(array &$data):?string
    {
        // force an own name
        return $data[SelfConst::ADDON_BASIC_INDEX_KEY];
    }

    /**
     * @param array $data
     * @return string|null
     */
    public function typeName(array &$data):?string
    {
        // force the default type
        return SelfConst::ADDON_BASIC_TYPE_NAME;
    }

    /**
     * @param array $data
     * @return string|null
     */
    public function idName(array &$data):?string
    {
        // force the default hash-method to get an id
        return null;
    }

    /**
     * @param array $data
     * @param array $searchWordList
     * @return array
     */
    public function bodyList(array &$data, $searchWordList = []):array
    {

        $dataList = $data[SelfConst::TRANS_INDEXER_LIST];
        $dataLinksList = $data[SelfConst::TRANS_INDEXER_LIST][SelfConst::ADDON_BASIC_LINKS];
        return [
            SelfConst::TRANS_INDEXER_SELF => $dataList[SelfConst::ADDON_BASIC_DOC_KEY],
            SelfConst::TRANS_INDEXER_HEADER => $dataList[SelfConst::ADDON_BASIC_HEADLINES],
            SelfConst::TRANS_INDEXER_TEXT => $dataList[SelfConst::ADDON_BASIC_BODY_TEXT],
            SelfConst::TRANS_INDEXER_HTML => $dataList[SelfConst::ADDON_BASIC_BODY_HTML],
            SelfConst::TRANS_INDEXER_LINKS => [
                SelfConst::TRANS_INDEXER_L_FOREIGN => $dataLinksList[SelfConst::ADDON_BASIC_LINKGROUP_FOREIGN],
                SelfConst::TRANS_INDEXER_L_OWN => $dataLinksList[SelfConst::ADDON_BASIC_LINKGROUP_OWN],
                SelfConst::TRANS_INDEXER_L_MENU => $dataLinksList[SelfConst::ADDON_BASIC_LINKGROUP_MENU],
            ],
        ];
    }

    /**
     * @todo add some logging functions
     *
     * @param array $indexParam
     * @return array|callable|false
     */
    public function insert($indexParam){
        try{
            // everything has worked 8-)
            return $this->elasticSearch->index($indexParam);
        } catch (BadRequest400Exception $e) {
            // indexing failed, because of badrequest failed  %-(
            return false;
        } catch (Missing404Exception $e) {
            // indexing failed, page does not exist or other 404-stuff  ?-(
            return false;
        } catch(Exception $e) {
            // indexing failed, because of some other reasons
            return false;
        }
    }

}
