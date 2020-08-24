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
class MyIndexController extends \TYPO3\CMS\Extbase\Mvc\Controller\ActionController
{

    /**
     * myIndexRepository
     * 
     * @var \Porthd\Mysearch\Domain\Repository\MyIndexRepository
     */
    protected $myIndexRepository = null;

    /**
     * @param \Porthd\Mysearch\Domain\Repository\MyIndexRepository $myIndexRepository
     */
    public function injectMyIndexRepository(\Porthd\Mysearch\Domain\Repository\MyIndexRepository $myIndexRepository)
    {
        $this->myIndexRepository = $myIndexRepository;
    }

    /**
     * action list
     * 
     * @return void
     */
    public function listAction()
    {
        $myIndices = $this->myIndexRepository->findAll();
        $this->view->assign('myIndices', $myIndices);
    }

    /**
     * action show
     * 
     * @param \Porthd\Mysearch\Domain\Model\MyIndex $myIndex
     * @return void
     */
    public function showAction(\Porthd\Mysearch\Domain\Model\MyIndex $myIndex)
    {
        $this->view->assign('myIndex', $myIndex);
    }

    /**
     * action dashBoard
     * 
     * @return void
     */
    public function dashBoardAction()
    {
    }

    /**
     * action simpleSearch
     * 
     * @return void
     */
    public function simpleSearchAction()
    {
    }

    /**
     * action multiSearch
     * 
     * @return void
     */
    public function multiSearchAction()
    {
    }

    /**
     * action customSearch
     * 
     * @return void
     */
    public function customSearchAction()
    {
    }

    /**
     * action deleteIndex
     * 
     * @return void
     */
    public function deleteIndexAction()
    {
    }

    /**
     * action writeInIndex
     * 
     * @return void
     */
    public function writeInIndexAction()
    {
    }

    /**
     * action deleteFromIndex
     * 
     * @return void
     */
    public function deleteFromIndexAction()
    {
    }

    /**
     * action errorPage
     * 
     * @return void
     */
    public function errorPageAction()
    {
    }
}
