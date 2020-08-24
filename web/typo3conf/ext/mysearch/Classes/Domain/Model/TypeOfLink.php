<?php
namespace Porthd\Mysearch\Domain\Model;


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
 * TypeOfLink
 */
class TypeOfLink extends \TYPO3\CMS\Extbase\DomainObject\AbstractEntity
{

    /**
     * untranslated Title for show in the Backend
     * 
     * @var string
     */
    protected $name = '';

    /**
     * translatable title for the valuepicker in other tables
     * 
     * @var string
     */
    protected $translationkey = '';

    /**
     * unique identifier
     * 
     * @var string
     */
    protected $ident = '';

    /**
     * optional description for internal use
     * 
     * @var string
     */
    protected $description = '';

    /**
     * Returns the name
     * 
     * @return string $name
     */
    public function getName()
    {
        return $this->name;
    }

    /**
     * Sets the name
     * 
     * @param string $name
     * @return void
     */
    public function setName($name)
    {
        $this->name = $name;
    }

    /**
     * Returns the translationkey
     * 
     * @return string $translationkey
     */
    public function getTranslationkey()
    {
        return $this->translationkey;
    }

    /**
     * Sets the translationkey
     * 
     * @param string $translationkey
     * @return void
     */
    public function setTranslationkey($translationkey)
    {
        $this->translationkey = $translationkey;
    }

    /**
     * Returns the ident
     * 
     * @return string $ident
     */
    public function getIdent()
    {
        return $this->ident;
    }

    /**
     * Sets the ident
     * 
     * @param string $ident
     * @return void
     */
    public function setIdent($ident)
    {
        $this->ident = $ident;
    }

    /**
     * Returns the description
     * 
     * @return string $description
     */
    public function getDescription()
    {
        return $this->description;
    }

    /**
     * Sets the description
     * 
     * @param string $description
     * @return void
     */
    public function setDescription($description)
    {
        $this->description = $description;
    }
}
