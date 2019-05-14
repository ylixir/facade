module Post exposing (main, metadataHtml)

import Html exposing (..)
import Html.Attributes as Attr exposing (alt, attribute, class, href, src)

import Elmstatic exposing (..)
import Page


tagsToHtml : List String -> List (Html Never)
tagsToHtml tags =
    let
        tagLink tag =
            "/tags/" ++ String.toLower tag

        linkify tag =
            a [ href <| tagLink tag ] [ text tag ]
    in
    List.map linkify tags


metadataHtml : Elmstatic.Post -> Html Never
metadataHtml post =
    div [ class "post-metadata" ]
        ([ span [] [ text post.date ]
         , span [] [ text "•" ]
         ]
            ++ tagsToHtml post.tags
        )


main : Elmstatic.Layout
main =
    Elmstatic.layout Elmstatic.decodePost <|
        \content ->
            Page.layout
                content.title
                [ metadataHtml content, Page.markdown content.markdown ]
