import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheorySymmetricMonoidalCategoriesTheoremCanonicalLaneLean

structure BraidedStructurePackage where
  monoidalCategory : SymmetricMonoidalCategoryPackage
  braiding : ∀ (A B : monoidalCategory.category), (monoidalCategory.tensorProduct A B) ≅ (monoidalCategory.tensorProduct B A)
  hexagonCondition : Prop
  naturality : Prop
  braidingAxioms : Prop

structure BraidedStructureEvidence (B : BraidedStructurePackage) where
  hexagonConditionClosed : B.hexagonCondition
  naturalityClosed : B.naturality
  braidingAxiomsClosed : B.braidingAxioms

def BraidedStructureClosed (B : BraidedStructurePackage) : Prop :=
  B.hexagonCondition ∧ B.naturality ∧ B.braidingAxioms

theorem braided_structure_closed_from_evidence
    (B : BraidedStructurePackage) (E : BraidedStructureEvidence B) :
    BraidedStructureClosed B := by
  exact And.intro E.hexagonConditionClosed
    (And.intro E.naturalityClosed E.braidingAxiomsClosed)

end CategoryTheorySymmetricMonoidalCategoriesTheoremCanonicalLaneLean
end HautevilleHouse