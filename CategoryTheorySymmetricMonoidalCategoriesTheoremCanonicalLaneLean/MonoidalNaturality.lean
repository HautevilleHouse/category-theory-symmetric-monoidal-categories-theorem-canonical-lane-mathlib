import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheorySymmetricMonoidalCategoriesTheoremCanonicalLaneLean

structure MonoidalNaturalityPackage where
  symmetricMonoidalCategory : SymmetricMonoidalCategoryPackage
  associatorNatural : Prop
  leftUnitorNatural : Prop
  rightUnitorNatural : Prop
  symmetryNatural : Prop
  coherenceConditions : Prop

structure MonoidalNaturalityEvidence (M : MonoidalNaturalityPackage) where
  associatorNaturalClosed : M.associatorNatural
  leftUnitorNaturalClosed : M.leftUnitorNatural
  rightUnitorNaturalClosed : M.rightUnitorNatural
  symmetryNaturalClosed : M.symmetryNatural
  coherenceConditionsClosed : M.coherenceConditions

def MonoidalNaturalityClosed (M : MonoidalNaturalityPackage) : Prop :=
  M.associatorNatural ∧ M.leftUnitorNatural ∧ M.rightUnitorNatural ∧
  M.symmetryNatural ∧ M.coherenceConditions

theorem monoidal_naturality_closed_from_evidence
    (M : MonoidalNaturalityPackage) (E : MonoidalNaturalityEvidence M) :
    MonoidalNaturalityClosed M := by
  exact And.intro E.associatorNaturalClosed
    (And.intro E.leftUnitorNaturalClosed
      (And.intro E.rightUnitorNaturalClosed
        (And.intro E.symmetryNaturalClosed E.coherenceConditionsClosed)))

end CategoryTheorySymmetricMonoidalCategoriesTheoremCanonicalLaneLean
end HautevilleHouse