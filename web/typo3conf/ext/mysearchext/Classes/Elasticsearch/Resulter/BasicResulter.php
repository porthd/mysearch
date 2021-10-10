<?php

namespace Porthd\Mysearchext\Elasticsearch\Resulter;

// https://dev.to/dendihandian/elasticsearch-in-laradock-nm4 URI for elastic depends to the port 9200 (default)
use Elasticsearch\Common\Exceptions\BadRequest400Exception;
use Porthd\Mysearchext\Config\SelfConst;


class BasicResulter implements ResulterInterface
{


    protected const SELF_NAME = 'Porthd_Mysearchext_BasicResulter';

    public function selfName():string
    {
        return self::SELF_NAME;
    }


}
