<?php
namespace Porthd\Mysearch\Controller;


/***
 *
 * This file is part of the "MySearch" Extension for TYPO3 CMS.
 *
 * For the full copyright and license information, please read the
 * LICENSE.txt file that was distributed with this source code.
 *
 *  (c) 2020 Dr. Dieter Porth <info@mobger.de>, -- privat --
 *
 ***/
/**
 * MyIndexController
 */
class MySearchController extends \TYPO3\CMS\Extbase\Mvc\Controller\ActionController
{
    // https://www.glohbe.de/de/elasticsearch-mit-php/
    /**
     * action searchPage
     *
     * @return void
     */
    public function mySearchPageAction($filterMySearch)
    {
//        Parameter indexName, typeName,
        $paramList = $filterMySearch->toArray();
        $customParam = $this->addCustomParams();
        $paramList = array_merge($paramList,$customParam);
        $rawList = $this->findQuery($filterMySearch);
        $uniqueList = $this->uniqueById($rawList);
        $resultList = $this->reduceToResult($rawList);
        $indexTypes = $this->getAllowedIndexesTypes();
        $this->view->assignMultiple([
           'resultList' => $resultList,
            'indexTypes' => $indexTypes,

        ]);
    }

    /**
     * action error
     *
     * @return void
     */
    public function errorAction()
    {
    }
}
