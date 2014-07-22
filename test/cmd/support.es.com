/*
    Support functions for the Http unit tests
 */

module support {
    require ejs.testme

    function http(args): String {
        let HOST = tget('TE_HTTP') || "127.0.0.1:4100"
        let httpcmd = Cmd.locate("http") + " --host " + HOST + " "
        let result = Cmd.run(httpcmd + args, {exception: false})
        return result.trim()
    }
}
