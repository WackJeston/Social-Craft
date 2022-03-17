<?php

namespace craft\contentmigrations;

use Craft;
use craft\db\Migration;

/**
 * m220317_092820_posts_migration migration.
 */
class m220317_092820_posts_migration extends Migration
{
    /**
     * @inheritdoc
     */
    public function safeUp()
    {
        // Place migration code here...
    }

    /**
     * @inheritdoc
     */
    public function safeDown()
    {
        echo "m220317_092820_posts_migration cannot be reverted.\n";
        return false;
    }
}
