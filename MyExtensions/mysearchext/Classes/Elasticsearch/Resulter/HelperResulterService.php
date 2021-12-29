<?php

namespace Porthd\Mysearchext\Elasticsearch\Resulter;

// https://dev.to/dendihandian/elasticsearch-in-laradock-nm4 URI for elastic depends to the port 9200 (default)
use Elasticsearch\ClientBuilder;
use Porthd\Mysearchext\Config\SelfConst;


class HelperResulterService
{

    protected const SELF_NAME = 'Porthd_Mysearchext_HelperResulter';

    function __construct()
    {
        $domain = getenv('DOMAIN_NAME') ?? SelfConst::SELF_DOMAIN_NAME;
        $addPort = getenv('DOMAIN_ELASTIC_ADDPORT') ?? SelfConst::SELF_DOMAIN_ELASTIC_ADDPORT;
        $this->elasticSearch = ClientBuilder::create()
            ->setHosts([$domain . $addPort])
            ->build();
    }

    /**
     * @return array
     */
    public function getCurrentIndexes()
    {
        return $this->elasticSearch->cat()->indices();
    }

}
