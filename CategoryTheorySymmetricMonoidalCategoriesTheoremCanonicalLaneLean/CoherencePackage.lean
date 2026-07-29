import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheorySymmetricMonoidalCategoriesTheoremCanonicalLaneLean

structure CoherencePackage where
  pentagonCondition : Prop
  triangleCondition : Prop
  hexagonCondition : Prop
  coherenceComplete : Prop

def CoherencePackageClosed (C : CoherencePackage) : Prop :=
  C.pentagonCondition ∧ C.triangleCondition ∧ C.hexagonCondition ∧ C.coherenceComplete

structure CoherenceEvidence (C : CoherencePackage) where
  pentagonClosed : C.pentagonCondition
  triangleClosed : C.triangleCondition
  hexagonClosed : C.hexagonCondition
  coherenceCompleteClosed : C.coherenceComplete

theorem coherence_package_closed_from_evidence (C : CoherencePackage) (E : CoherenceEvidence C) :
    CoherencePackageClosed C := by
  exact And.intro E.pentagonClosed (And.intro E.triangleClosed (And.intro E.hexagonClosed E.coherenceCompleteClosed))

end CategoryTheorySymmetricMonoidalCategoriesTheoremCanonicalLaneLean
end HautevilleHouse