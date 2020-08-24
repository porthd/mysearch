<?php
namespace Porthd\Mysearch\Tests\Unit\Domain\Model;

/**
 * Test case.
 *
 * @author Dr. Dieter Porth <info@mobger.de>
 */
class GradeOfLinkTest extends \TYPO3\TestingFramework\Core\Unit\UnitTestCase
{
    /**
     * @var \Porthd\Mysearch\Domain\Model\GradeOfLink
     */
    protected $subject = null;

    protected function setUp()
    {
        parent::setUp();
        $this->subject = new \Porthd\Mysearch\Domain\Model\GradeOfLink();
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
    public function getTranslationkeyReturnsInitialValueForString()
    {
        self::assertSame(
            '',
            $this->subject->getTranslationkey()
        );
    }

    /**
     * @test
     */
    public function setTranslationkeyForStringSetsTranslationkey()
    {
        $this->subject->setTranslationkey('Conceived at T3CON10');

        self::assertAttributeEquals(
            'Conceived at T3CON10',
            'translationkey',
            $this->subject
        );
    }

    /**
     * @test
     */
    public function getIdentReturnsInitialValueForString()
    {
        self::assertSame(
            '',
            $this->subject->getIdent()
        );
    }

    /**
     * @test
     */
    public function setIdentForStringSetsIdent()
    {
        $this->subject->setIdent('Conceived at T3CON10');

        self::assertAttributeEquals(
            'Conceived at T3CON10',
            'ident',
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
}
