<?php

namespace Porthd\Mysearch\Elasticsearch\Resulter;

// https://dev.to/dendihandian/elasticsearch-in-laradock-nm4 URI for elastic depends to the port 9200 (default)
use Elasticsearch\Common\Exceptions\BadRequest400Exception;
use Porthd\Mysearch\Config\SelfConst;


class BasicResulter implements ResulterInterface
{


    protected const SELF_NAME = 'Porthd_Mysearch_BasicResulter';

    public function selfName():string
    {
        return self::SELF_NAME;
    }

//    public $elasticsearch;
//
//    function __construct()
//    {
//        $domain = getenv('DOMAIN_NAME') ?? SelfConst::SELF_DOMAIN_NAME;
//        $addPort = getenv('DOMAIN_ELASTIC_ADDPORT') ?? SelfConst::SELF_DOMAIN_ELASTIC_ADDPORT;
//        $this->elasticsearch = \Elasticsearch\ClientBuilder::create()
//            ->setHosts([$domain . $addPort])
//            ->build();
//    }


}
