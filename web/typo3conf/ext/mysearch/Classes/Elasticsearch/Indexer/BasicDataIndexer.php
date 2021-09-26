<?php

namespace Porthd\Mysearch\Elasticsearch\Indexer;

// https://dev.to/dendihandian/elasticsearch-in-laradock-nm4 URI for elastic depends to the port 9200 (default)
use Elasticsearch\Common\Exceptions\BadRequest400Exception;
use Porthd\Mysearch\Config\SelfConst;
use Porthd\Mysearch\Domain\Model\DataDocumentInterface;


class BasicDataIndexer implements IndexerInterface
{

    protected const SELF_NAME = 'Porthd_Mysearch_BasicDataIndexer';
    public $es;

    function __construct()
    {
        $domain = getenv('DOMAIN_NAME') ?? SelfConst::SELF_DOMAIN_NAME;
            $addPort = getenv('DOMAIN_ELASTIC_ADDPORT') ?? SelfConst::SELF_DOMAIN_ELASTIC_ADDPORT;
            $this->es = \Elasticsearch\ClientBuilder::create()
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
        return new \Porthd\Mysearch\Domain\Model\BasicData();
    }

    public function getNeededRawData():array
    {
        return SelfConst::BASIC_REQUEST_KEY_LIST;
    }

    public function normalizeRequest(array &$requestData):bool
    {
        return true;
    }
    public function extendRequest(array &$requestData):bool
    {
        return true;
    }
    public function reviewRequest(array &$requestData):bool
    {
        return true;
    }
    public function reduceRequest(array &$requestData):bool
    {
        return true;
    }
    public function buildRequest(array &$requestData):bool
    {

        return true;
    }

    public function flagRequestToIndex(array $request):boolean
    {
        return true;
    }

//    public function buildParamArray(array $normalizedParam)
//    {
//        if($type == 'blog'){
//            $params = [
//                'index' => $p->shopUrl.'-'.$p->lang,
//                'type' => $type,
//                'id' => $p->blogID,
//                'body' => [
//                    'lang' => $p->lang,
//                    'metaTitle' => $p->metaTitle,
//                    'metaDescription' => $p->metaDescription,
//                    'name' => $p->name,
//                    'teaser' => $p->teaser,
//                    'content' => $p->content
//                ]
//            ];
//        }
//        return $param;
//    }

    public function insert($params){
        try{
            // Alles hat geklappt
            return $this->es->index($params);
        } catch (BadRequest400Exception $e) {
            // Speichern fehlgeschlagen
            return false;
        }
    }

    public function indexName(array &$request):?string
    {
        return null;
    }
    public function typeName(array &$request):?string
    {
        return null;
    }
    public function idName(array &$request):?string
    {
        return null;
    }
    public function contentList(array &$request):array
    {
        return $request;
    }

}
