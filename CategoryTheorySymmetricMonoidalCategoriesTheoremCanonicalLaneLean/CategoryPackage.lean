import canonicalLaneMathlib.AdmissibleClass
import Mathlib.CategoryTheory.Category.Basic

namespace HautevilleHouse
namespace CategoryTheorySymmetricMonoidalCategoriesTheoremCanonicalLaneLean

structure CategoryPackage where
  obj : Type u
  hom : obj → obj → Type v
  identity : ∀ (X : obj), hom X X
  compose : ∀ {X Y Z : obj}, hom Y Z → hom X Y → hom X Z
  identityLeft : ∀ {X Y : obj} (f : hom X Y), compose (identity Y) f = f
  identityRight : ∀ {X Y : obj} (f : hom X Y), compose f (identity X) = f
  associativity : ∀ {W X Y Z : obj} (f : hom W X) (g : hom X Y) (h : hom Y Z),
    compose (compose h g) f = compose h (compose g f)

structure CategoryEvidence (C : CategoryPackage) where
  identityLeftClosed : ∀ {X Y : obj C} (f : hom C X Y), C.compose (C.identity Y) f = f
  identityRightClosed : ∀ {X Y : obj C} (f : hom C X Y), C.compose f (C.identity X) = f
  associativityClosed : ∀ {W X Y Z : obj C} (f : hom C W X) (g : hom C X Y) (h : hom C Y Z),
    C.compose (C.compose h g) f = C.compose h (C.compose g f)

def CategoryClosed (C : CategoryPackage) : Prop :=
  C.identityLeft C.identityRight C.associativity

theorem category_closed_from_evidence (C : CategoryPackage) (E : CategoryEvidence C) :
    CategoryClosed C := by
  exact And.intro E.identityLeftClosed (And.intro E.identityRightClosed E.associativityClosed)

end CategoryTheorySymmetricMonoidalCategoriesTheoremCanonicalLaneLean
end HautevilleHouse