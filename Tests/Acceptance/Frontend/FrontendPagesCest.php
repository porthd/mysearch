<?php
declare(strict_types = 1);
namespace Porthd\Mysearch\Tests\Acceptance\Frontend;

use Porthd\Mysearch\Tests\Acceptance\Support\AcceptanceTester;
class FrontendPagesCest
{
    /**
     * @param AcceptanceTester $I
     */
    public function firstPageIsRendered(AcceptanceTester $I)
    {
        $I->amOnPage('/');
        $I->see('Page Not Found');
//        $I->click('Customize');
//        $I->see('Incredible flexible');
    }
}