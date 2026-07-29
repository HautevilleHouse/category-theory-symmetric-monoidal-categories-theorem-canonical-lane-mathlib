import canonicalLaneMathlib.AdmissibleClass

/-!
# Symmetric Monoidal Category Package
-/

namespace HautevilleHouse
namespace CategoryTheorySymmetricMonoidalCategoriesTheoremCanonicalLaneLean

structure SymmetricMonoidalCategory where
  obj : Type u
  hom : obj → obj → Type v
  id : (X : obj) → hom X X
  comp : {X Y Z : obj} → hom X Y → hom Y Z → hom X Z
  tensor : obj → obj → obj
  tensorHom : {X Y Z W : obj} → hom X Y → hom Z W → hom (tensor X Z) (tensor Y W)
  associator : (X Y Z : obj) → hom (tensor (tensor X Y) Z) (tensor X (tensor Y Z))
  leftUnitor : (X : obj) → hom (tensor unit X) X
  rightUnitor : (X : obj) → hom (tensor X unit) X
  symmetry : (X Y : obj) → hom (tensor X Y) (tensor Y X)
  unit : obj
  assoc_coh : Prop
  unit_coh : Prop
  symm_coh : Prop

structure SymmetricMonoidalCategoryEvidence (C : SymmetricMonoidalCategory) where
  assoc_coh_closed : C.assoc_coh
  unit_coh_closed : C.unit_coh
  symm_coh_closed : C.symm_coh

def SymmetricMonoidalCategoryClosed (C : SymmetricMonoidalCategory) : Prop :=
  C.assoc_coh ∧ C.unit_coh ∧ C.symm_coh

theorem symmetric_monoidal_category_closed_from_evidence
    (C : SymmetricMonoidalCategory) (E : SymmetricMonoidalCategoryEvidence C) :
    SymmetricMonoidalCategoryClosed C := by
  exact And.intro E.assoc_coh_closed (And.intro E.unit_coh_closed E.symm_coh_closed)

end CategoryTheorySymmetricMonoidalCategoriesTheoremCanonicalLaneLean
end HautevilleHouse