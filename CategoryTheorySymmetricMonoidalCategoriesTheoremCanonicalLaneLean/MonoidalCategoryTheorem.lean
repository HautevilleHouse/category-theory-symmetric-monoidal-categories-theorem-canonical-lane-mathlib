import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheorySymmetricMonoidalCategoriesTheoremCanonicalLaneLean

structure MonoidalCategoryTheoremPackage where
  category : Type u → Type u
  tensorProduct : Type u → Type u → Type u
  unit : Type u
  associativity : ∀ (A B C : Type u), A ⊗ (B ⊗ C) ≅ (A ⊗ B) ⊗ C
  leftIdentity : ∀ (A : Type u), unit ⊗ A ≅ A
  rightIdentity : ∀ (A : Type u), A ⊗ unit ≅ A
  pentagonCoherence : Prop
  triangleCoherence : Prop

structure MonoidalCategoryTheoremEvidence (M : MonoidalCategoryTheoremPackage) where
  associativityNatural : M.associativityNatural
  leftIdentityNatural : M.leftIdentityNatural
  rightIdentityNatural : M.rightIdentityNatural
  pentagonCoherenceClosed : M.pentagonCoherence
  triangleCoherenceClosed : M.triangleCoherence

def MonoidalCategoryTheoremClosed (M : MonoidalCategoryTheoremPackage) : Prop :=
  M.associativityNatural ∧ M.leftIdentityNatural ∧ M.rightIdentityNatural ∧
  M.pentagonCoherence ∧ M.triangleCoherence

theorem monoidal_category_theorem_closed_from_evidence
    (M : MonoidalCategoryTheoremPackage)
    (E : MonoidalCategoryTheoremEvidence M) : MonoidalCategoryTheoremClosed M := by
  exact And.intro E.associativityNatural
    (And.intro E.leftIdentityNatural
      (And.intro E.rightIdentityNatural
        (And.intro E.pentagonCoherenceClosed E.triangleCoherenceClosed)))

end CategoryTheorySymmetricMonoidalCategoriesTheoremCanonicalLaneLean
end HautevilleHouse
