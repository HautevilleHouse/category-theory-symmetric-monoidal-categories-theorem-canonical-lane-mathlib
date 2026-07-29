import canonicalLaneMathlib.AdmissibleClass

/-!
# Symmetric Monoidal Categories Package
-/

namespace HautevilleHouse
namespace CategoryTheorySymmetricMonoidalCategoriesTheoremCanonicalLaneLean

structure SymmetricMonoidalCategoryPackage where
  underlyingCategory : Type u
  tensorProduct : underlyingCategory -> underlyingCategory -> underlyingCategory
  unitObject : underlyingCategory
  associator : Prop
  leftUnitor : Prop
  rightUnitor : Prop
  symmetry : Prop
  pentagonIdentity : Prop
  triangleIdentity : Prop
  symmetryInvolutive : Prop
  coherenceConditions : Prop

structure SymmetricMonoidalCategoryEvidence (C : SymmetricMonoidalCategoryPackage) where
  associatorClosed : C.associator
  leftUnitorClosed : C.leftUnitor
  rightUnitorClosed : C.rightUnitor
  symmetryClosed : C.symmetry
  pentagonIdentityClosed : C.pentagonIdentity
  triangleIdentityClosed : C.triangleIdentity
  symmetryInvolutiveClosed : C.symmetryInvolutive
  coherenceConditionsClosed : C.coherenceConditions

def SymmetricMonoidalCategoryClosed (C : SymmetricMonoidalCategoryPackage) : Prop :=
  C.associator ∧ C.leftUnitor ∧ C.rightUnitor ∧ C.symmetry ∧
  C.pentagonIdentity ∧ C.triangleIdentity ∧ C.symmetryInvolutive ∧ C.coherenceConditions

theorem symmetric_monoidal_category_closed_from_evidence
    (C : SymmetricMonoidalCategoryPackage) (E : SymmetricMonoidalCategoryEvidence C) :
    SymmetricMonoidalCategoryClosed C := by
  exact And.intro E.associatorClosed
    (And.intro E.leftUnitorClosed
      (And.intro E.rightUnitorClosed
        (And.intro E.symmetryClosed
          (And.intro E.pentagonIdentityClosed
            (And.intro E.triangleIdentityClosed
              (And.intro E.symmetryInvolutiveClosed E.coherenceConditionsClosed))))))

end CategoryTheorySymmetricMonoidalCategoriesTheoremCanonicalLaneLean
end HautevilleHouse