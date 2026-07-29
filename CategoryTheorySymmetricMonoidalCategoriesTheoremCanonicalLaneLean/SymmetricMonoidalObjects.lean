import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheorySymmetricMonoidalCategoriesTheoremCanonicalLaneLean

structure SymmetricMonoidalCategory where
  carrier : Type u
  tensorProduct : carrier → carrier → carrier
  unitObject : carrier
  associator : ∀ (X Y Z : carrier), (tensorProduct (tensorProduct X Y) Z) ≅ (tensorProduct X (tensorProduct Y Z))
  leftUnitor : ∀ (X : carrier), (tensorProduct unitObject X) ≅ X
  rightUnitor : ∀ (X : carrier), (tensorProduct X unitObject) ≅ X
  symmetry : ∀ (X Y : carrier), (tensorProduct X Y) ≅ (tensorProduct Y X)
  coherenceConditions : Prop

def SymmetricMonoidalCategoryClosed (C : SymmetricMonoidalCategory) : Prop :=
  C.coherenceConditions

end CategoryTheorySymmetricMonoidalCategoriesTheoremCanonicalLaneLean
end HautevilleHouse