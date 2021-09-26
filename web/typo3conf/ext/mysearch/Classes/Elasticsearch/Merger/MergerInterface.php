<?php

namespace Porthd\Mysearch\Elasticsearch\Merger;

// https://dev.to/dendihandian/elasticsearch-in-laradock-nm4 URI for elastic depends to the port 9200 (default)
use Porthd\Mysearch\Domain\Model\DataDocumentInterface;

interface MergerInterface
{

    public function selfName():string;

}
