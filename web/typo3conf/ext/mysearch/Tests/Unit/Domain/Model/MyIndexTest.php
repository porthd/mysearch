<?php
namespace Porthd\Mysearch\Tests\Unit\Domain\Model;

/**
 * Test case.
 *
 * @author Dr. Dieter Porth <info@mobger.de>
 */
class MyIndexTest extends \TYPO3\TestingFramework\Core\Unit\UnitTestCase
{
    /**
     * @var \Porthd\Mysearch\Domain\Model\MyIndex
     */
    protected $subject = null;

    protected function setUp()
    {
        parent::setUp();
        $this->subject = new \Porthd\Mysearch\Domain\Model\MyIndex();
    }

    protected function tearDown()
    {
        parent::tearDown();
    }

    /**
     * @test
     */
    public function getNameReturnsInitialValueForString()
    {
        self::assertSame(
            '',
            $this->subject->getName()
        );
    }

    /**
     * @test
     */
    public function setNameForStringSetsName()
    {
        $this->subject->setName('Conceived at T3CON10');

        self::assertAttributeEquals(
            'Conceived at T3CON10',
            'name',
            $this->subject
        );
    }

    /**
     * @test
     */
    public function getVendorReturnsInitialValueForString()
    {
        self::assertSame(
            '',
            $this->subject->getVendor()
        );
    }

    /**
     * @test
     */
    public function setVendorForStringSetsVendor()
    {
        $this->subject->setVendor('Conceived at T3CON10');

        self::assertAttributeEquals(
            'Conceived at T3CON10',
            'vendor',
            $this->subject
        );
    }

    /**
     * @test
     */
    public function getDescriptionReturnsInitialValueForString()
    {
        self::assertSame(
            '',
            $this->subject->getDescription()
        );
    }

    /**
     * @test
     */
    public function setDescriptionForStringSetsDescription()
    {
        $this->subject->setDescription('Conceived at T3CON10');

        self::assertAttributeEquals(
            'Conceived at T3CON10',
            'description',
            $this->subject
        );
    }

    /**
     * @test
     */
    public function getIndexIdentReturnsInitialValueForString()
    {
        self::assertSame(
            '',
            $this->subject->getIndexIdent()
        );
    }

    /**
     * @test
     */
    public function setIndexIdentForStringSetsIndexIdent()
    {
        $this->subject->setIndexIdent('Conceived at T3CON10');

        self::assertAttributeEquals(
            'Conceived at T3CON10',
            'indexIdent',
            $this->subject
        );
    }

    /**
     * @test
     */
    public function getIndexScoreFactorReturnsInitialValueForFloat()
    {
        self::assertSame(
            0.0,
            $this->subject->getIndexScoreFactor()
        );
    }

    /**
     * @test
     */
    public function setIndexScoreFactorForFloatSetsIndexScoreFactor()
    {
        $this->subject->setIndexScoreFactor(3.14159265);

        self::assertAttributeEquals(
            3.14159265,
            'indexScoreFactor',
            $this->subject,
            '',
            0.000000001
        );
    }

    /**
     * @test
     */
    public function getTitleTransKeyReturnsInitialValueForString()
    {
        self::assertSame(
            '',
            $this->subject->getTitleTransKey()
        );
    }

    /**
     * @test
     */
    public function setTitleTransKeyForStringSetsTitleTransKey()
    {
        $this->subject->setTitleTransKey('Conceived at T3CON10');

        self::assertAttributeEquals(
            'Conceived at T3CON10',
            'titleTransKey',
            $this->subject
        );
    }

    /**
     * @test
     */
    public function getDescriptionTransKeyReturnsInitialValueForString()
    {
        self::assertSame(
            '',
            $this->subject->getDescriptionTransKey()
        );
    }

    /**
     * @test
     */
    public function setDescriptionTransKeyForStringSetsDescriptionTransKey()
    {
        $this->subject->setDescriptionTransKey('Conceived at T3CON10');

        self::assertAttributeEquals(
            'Conceived at T3CON10',
            'descriptionTransKey',
            $this->subject
        );
    }

    /**
     * @test
     */
    public function getLinkbaseFilesFolderReturnsInitialValueForString()
    {
        self::assertSame(
            '',
            $this->subject->getLinkbaseFilesFolder()
        );
    }

    /**
     * @test
     */
    public function setLinkbaseFilesFolderForStringSetsLinkbaseFilesFolder()
    {
        $this->subject->setLinkbaseFilesFolder('Conceived at T3CON10');

        self::assertAttributeEquals(
            'Conceived at T3CON10',
            'linkbaseFilesFolder',
            $this->subject
        );
    }

    /**
     * @test
     */
    public function getDefaultTypeReturnsInitialValueForString()
    {
        self::assertSame(
            '',
            $this->subject->getDefaultType()
        );
    }

    /**
     * @test
     */
    public function setDefaultTypeForStringSetsDefaultType()
    {
        $this->subject->setDefaultType('Conceived at T3CON10');

        self::assertAttributeEquals(
            'Conceived at T3CON10',
            'defaultType',
            $this->subject
        );
    }

    /**
     * @test
     */
    public function getDefaultGradeReturnsInitialValueForString()
    {
        self::assertSame(
            '',
            $this->subject->getDefaultGrade()
        );
    }

    /**
     * @test
     */
    public function setDefaultGradeForStringSetsDefaultGrade()
    {
        $this->subject->setDefaultGrade('Conceived at T3CON10');

        self::assertAttributeEquals(
            'Conceived at T3CON10',
            'defaultGrade',
            $this->subject
        );
    }
}
