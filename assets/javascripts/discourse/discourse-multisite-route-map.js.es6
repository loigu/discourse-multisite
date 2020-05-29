export default function() {
  this.route("discourse-multisite", function() {
    this.route("actions", function() {
      this.route("show", { path: "/:id" });
    });
  });
};
