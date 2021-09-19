<?php

namespace Porthd\Mysearch\Domain\Indexed;

// https://dev.to/dendihandian/elasticsearch-in-laradock-nm4 URI for elastic depends to the port 9200 (default)
use Porthd\Mysearch\Config\SelfConst;

class ElasticsearchIndexed
{
    public $es;

    function __construct()
    {
        $domain = getenv('DOMAIN_NAME') ?? SelfConst::SELF_DOMAIN_NAME;
            $addPort = getenv('DOMAIN_ELASTIC_ADDPORT') ?? SelfConst::SELF_DOMAIN_ELASTIC_ADDPORT;
            $this->es = \Elasticsearch\ClientBuilder::create()
                ->setHosts([$domain . $addPort])
                ->build();
    }

    public function insert($p,$type='blog'){
        if($type == 'blog'){
            $params = [
                'index' => $p->shopUrl.'-'.$p->lang,
                'type' => $type,
                'id' => $p->blogID,
                'body' => [
                    'lang' => $p->lang,
                    'metaTitle' => $p->metaTitle,
                    'metaDescription' => $p->metaDescription,
                    'name' => $p->name,
                    'teaser' => $p->teaser,
                    'content' => $p->content
                ]
            ];
        }
        /*....*/
        try{
            // Alles hat geklappt
            $indexed = $this->es->index($params);
            return $indexed;
        } catch (Elasticsearch\Common\Exceptions\BadRequest400Exception $e) {
            // Speichern fehlgeschlagen
            return false;
        }
    }
}
