<?php

namespace Porthd\Mysearchext\Elasticsearch\Resulter;

// https://dev.to/dendihandian/elasticsearch-in-laradock-nm4 URI for elastic depends to the port 9200 (default)
use Porthd\Mysearchext\Domain\Model\DataDocumentInterface;

interface ResulterInterface
{

    public function selfName():string;

}
