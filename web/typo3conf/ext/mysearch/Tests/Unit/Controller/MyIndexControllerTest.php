<?php
namespace Porthd\Mysearch\Tests\Unit\Controller;

/**
 * Test case.
 *
 * @author Dr. Dieter Porth <info@mobger.de>
 */
class MyIndexControllerTest extends \TYPO3\TestingFramework\Core\Unit\UnitTestCase
{
    /**
     * @var \Porthd\Mysearch\Controller\MyIndexController
     */
    protected $subject = null;

    protected function setUp()
    {
        parent::setUp();
        $this->subject = $this->getMockBuilder(\Porthd\Mysearch\Controller\MyIndexController::class)
            ->setMethods(['redirect', 'forward', 'addFlashMessage'])
            ->disableOriginalConstructor()
            ->getMock();
    }

    protected function tearDown()
    {
        parent::tearDown();
    }

    /**
     * @test
     */
    public function listActionFetchesAllMyIndicesFromRepositoryAndAssignsThemToView()
    {

        $allMyIndices = $this->getMockBuilder(\TYPO3\CMS\Extbase\Persistence\ObjectStorage::class)
            ->disableOriginalConstructor()
            ->getMock();

        $myIndexRepository = $this->getMockBuilder(\Porthd\Mysearch\Domain\Repository\MyIndexRepository::class)
            ->setMethods(['findAll'])
            ->disableOriginalConstructor()
            ->getMock();
        $myIndexRepository->expects(self::once())->method('findAll')->will(self::returnValue($allMyIndices));
        $this->inject($this->subject, 'myIndexRepository', $myIndexRepository);

        $view = $this->getMockBuilder(\TYPO3\CMS\Extbase\Mvc\View\ViewInterface::class)->getMock();
        $view->expects(self::once())->method('assign')->with('myIndices', $allMyIndices);
        $this->inject($this->subject, 'view', $view);

        $this->subject->listAction();
    }

    /**
     * @test
     */
    public function showActionAssignsTheGivenMyIndexToView()
    {
        $myIndex = new \Porthd\Mysearch\Domain\Model\MyIndex();

        $view = $this->getMockBuilder(\TYPO3\CMS\Extbase\Mvc\View\ViewInterface::class)->getMock();
        $this->inject($this->subject, 'view', $view);
        $view->expects(self::once())->method('assign')->with('myIndex', $myIndex);

        $this->subject->showAction($myIndex);
    }

    /**
     * @test
     */
    public function deleteActionRemovesTheGivenMyIndexFromMyIndexRepository()
    {
        $myIndex = new \Porthd\Mysearch\Domain\Model\MyIndex();

        $myIndexRepository = $this->getMockBuilder(\Porthd\Mysearch\Domain\Repository\MyIndexRepository::class)
            ->setMethods(['remove'])
            ->disableOriginalConstructor()
            ->getMock();

        $myIndexRepository->expects(self::once())->method('remove')->with($myIndex);
        $this->inject($this->subject, 'myIndexRepository', $myIndexRepository);

        $this->subject->deleteAction($myIndex);
    }

    /**
     * @test
     */
    public function deleteActionRemovesTheGivenMyIndexFromMyIndexRepository()
    {
        $myIndex = new \Porthd\Mysearch\Domain\Model\MyIndex();

        $myIndexRepository = $this->getMockBuilder(\Porthd\Mysearch\Domain\Repository\MyIndexRepository::class)
            ->setMethods(['remove'])
            ->disableOriginalConstructor()
            ->getMock();

        $myIndexRepository->expects(self::once())->method('remove')->with($myIndex);
        $this->inject($this->subject, 'myIndexRepository', $myIndexRepository);

        $this->subject->deleteAction($myIndex);
    }
}
