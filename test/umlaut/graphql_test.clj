(ns umlaut.graphql-test
  (:require [clojure.test :refer :all]
            [umlaut.core :as core]
            [umlaut.generators.graphql :as graphql]))

(def fixture (slurp "test/fixtures/person/graphql.fixture"))

(deftest graphql-test
  (testing "GraphQL generator test"
    (is (= fixture (graphql/gen ["test/fixtures/person/person.umlaut" "test/fixtures/person/profession.umlaut"])))))
