import { acceptance } from "helpers/qunit-helpers";

acceptance("discourse_multisite", { loggedIn: true });

test("discourse_multisite works", async assert => {
  await visit("/admin/plugins/discourse-multisite");

  assert.ok(false, "it shows the discourse_multisite button");
});
