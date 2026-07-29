import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheorySymmetricMonoidalCategoriesTheoremCanonicalLaneLean

structure BraidedMonoidalStructurePackage where
  monoidalStructure : MonoidalCategoryTheoremPackage
  braiding : ∀ (A B : Type u), A ⊗ B ≅ B ⊗ A
  hexagonCoherence : Prop
  naturality : Prop

structure BraidedMonoidalStructureEvidence (B : BraidedMonoidalStructurePackage) where
  hexagonCoherenceClosed : B.hexagonCoherence
  naturalityClosed : B.naturality
  monoidalEvidence : MonoidalCategoryTheoremEvidence B.monoidalStructure

def BraidedMonoidalStructureClosed (B : BraidedMonoidalStructurePackage) : Prop :=
  B.hexagonCoherence ∧ B.naturality ∧ MonoidalCategoryTheoremClosed B.monoidalStructure

theorem braided_monoidal_structure_closed_from_evidence
    (B : BraidedMonoidalStructurePackage)
    (E : BraidedMonoidalStructureEvidence B) : BraidedMonoidalStructureClosed B := by
  exact And.intro E.hexagonCoherenceClosed
    (And.intro E.naturalityClosed
      (monoidal_category_theorem_closed_from_evidence B.monoidalStructure E.monoidalEvidence))

end CategoryTheorySymmetricMonoidalCategoriesTheoremCanonicalLaneLean
end HautevilleHouse
