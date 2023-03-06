// 3rd Party Imports

import Array "mo:base/Array";
import Blob "mo:base/Blob";
import Cycles "mo:base/ExperimentalCycles";
// import Ext "mo:ext/Ext";
import Float "mo:base/Float";
import Iter "mo:base/Iter";
import Nat "mo:base/Nat";
import Int "mo:base/Int";
import Nat8 "mo:base/Nat8";
import Nat32 "mo:base/Nat32";
import Nat64 "mo:base/Nat64";
import Prim "mo:prim";
import Principal "mo:base/Principal";
import Text "mo:base/Text";

import Types "types";
import SuperTypes "../types";


module {

    public class HttpHandler () {

       

        // Craft an HTTP response from an Asset Record.
        private func renderAsset (
            
        ) : Types.Response {
            {
                body = Blob.fromArray([]);//state.assets._flattenPayload(asset.asset.payload);
                headers = [
                    ("Content-Type", ""),
                    ("Access-Control-Allow-Origin", "*"),
                ];
                status_code = 200;
                streaming_strategy = null;
            }
        };



   

        ////////////////////
        // Path Handlers //
        //////////////////



        // @path: *?tokenid

        public func httpIndex(message : Text) : Types.Response {
                return {
                    status_code = 200;
                    headers = [("content-type", "text/html")];
                    body = Text.encodeUtf8 (
                       message
                    );
                    streaming_strategy = null;
                };

        };


        public func renderToken(token: SuperTypes.TokenInfo): Types.Response{
            let metadata = token.metadata;
            var message = "not support";
            switch(metadata){
                case(?md){
                    switch(md.location){
                        case(#InCanister blob){
                            
                        };
                        case(#AssetCanister asset){

                        };
                        case(#IPFS ipfs){

                        };
                        case(#Web url){
                            message := "<img src='"# url #"' />";
                        };
                    };
                    
                };
                case(_){
                    message := "no metadata found"
                };
            };
                return {
                   body = Text.encodeUtf8(
                    "<!doctype html>" #
                    "<html><body>" #                        
                        message #
                        "<h2> #"# Nat.toText(token.index +1 ) # "</h2>" #
                    "</body></html>"
                );
                headers = [
                    ("Content-Type", "text/html"),
                    ("Cache-Control", "max-age=31536000"), // Cache one year
                ];
                status_code = 200;
                streaming_strategy = null;
                };
        };
        public func renderMesssage(message: Text): Types.Response{
                return {
                    status_code = 200;
                    headers = [("content-type", "text/plain")];
                    body = Text.encodeUtf8 (
                        message
                    );
                    streaming_strategy = null;
                };
        };
   


        // A 404 response with an optional error message.
        private func http404(msg : ?Text) : Types.Response {
            {
                body = Text.encodeUtf8(
                    switch (msg) {
                        case (?msg) msg;
                        case null "Not found.";
                    }
                );
                headers = [
                    ("Content-Type", "text/plain"),
                ];
                status_code = 404;
                streaming_strategy = null;
            };
        };


        // A 400 response with an optional error message.
        private func http400(msg : ?Text) : Types.Response {
            {
                body = Text.encodeUtf8(
                    switch (msg) {
                        case (?msg) msg;
                        case null "Bad request.";
                    }
                );
                headers = [
                    ("Content-Type", "text/plain"),
                ];
                status_code = 400;
                streaming_strategy = null;
            };
        };



        // public func request(request : Types.Request) : Types.Response {
            

        //     // if (Text.contains(request.url, #text("tokenid"))) {
        //     //     let tokenId = Iter.toArray(Text.tokens(request.url, #text("tokenid=")))[1];
        //     //     let tokenind = ExtCore.TokenIdentifier.getIndex(tokenId);
        //     //     return renderTicket("text/plain", Text.encodeUtf8 ("ICEvent NFTicket" # "\n"  ));
        //     // }else{
        //         return httpIndex(request);
        //     // }

            

        //     // Paths

        //     //let path = Iter.toArray(Text.tokens(request.url, #text("/")));


        //     // 404

            
        // };
    };
};