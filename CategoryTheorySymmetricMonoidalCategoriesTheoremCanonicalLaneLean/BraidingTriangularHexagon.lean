import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheorySymmetricMonoidalCategoriesTheoremCanonicalLaneLean

structure BraidingTriangularHexagonPackage where
  symmetryNaturality : Prop
  hexagonCondition : Prop
  coherenceWithAssociator : Prop

def BraidingTriangularHexagonClosed (B : BraidingTriangularHexagonPackage) : Prop :=
  B.symmetryNaturality ∧ B.hexagonCondition ∧ B.coherenceWithAssociator

structure BraidingTriangularHexagonEvidence (B : BraidingTriangularHexagonPackage) where
  symmetryNaturalityClosed : B.symmetryNaturality
  hexagonConditionClosed : B.hexagonCondition
  coherenceWithAssociatorClosed : B.coherenceWithAssociator

theorem braiding_triangular_hexagon_closed_from_evidence
    (B : BraidingTriangularHexagonPackage) (E : BraidingTriangularHexagonEvidence B) :
    BraidingTriangularHexagonClosed B := by
  exact And.intro E.symmetryNaturalityClosed (And.intro E.hexagonConditionClosed E.coherenceWithAssociatorClosed)

end CategoryTheorySymmetricMonoidalCategoriesTheoremCanonicalLaneLean
end HautevilleHouse