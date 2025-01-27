using Microsoft.AspNetCore.Mvc.Testing;

namespace DockerCourseTests
{
    [TestClass]
    public sealed class Tests
    {
        [TestMethod]
        public void Assert_True_Is_True()
        {
            Assert.IsTrue(true);
        }

        [TestMethod]
        public void Assert_False_Is_False()
        {
            Assert.IsFalse(false);
        }

        [TestMethod]
        public async Task GivenGetRequestToPodCastsEndpoint_ShouldReturnOkay()
        {
            var httpClient = new CustomWebApplicationFactory().CreateClient();
            var response = await httpClient.GetAsync("/podcasts");
            Assert.AreEqual(System.Net.HttpStatusCode.OK, response.StatusCode);
        }
    }
}
