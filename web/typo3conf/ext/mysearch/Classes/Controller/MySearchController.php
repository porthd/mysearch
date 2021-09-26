<?php
namespace Porthd\Mysearch\Controller;


/***
 *
 * This file is part of the "Mysearch" Extension for TYPO3 CMS.
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
class MysearchController extends \TYPO3\CMS\Extbase\Mvc\Controller\ActionController
{
    // https://www.glohbe.de/de/elasticsearch-mit-php/
    /**
     * action searchPage
     *
     * @return void
     */
    public function mysearchPageAction($filterMysearch)
    {
//        Parameter indexName, typeName,
        $paramList = $filterMysearch->toArray();
        $customParam = $this->addCustomParams();
        $paramList = array_merge($paramList,$customParam);
        $rawList = $this->findQuery($filterMysearch);
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
