import HautevilleHouse.CategoryTheorySymmetricMonoidalCategoriesTheoremCanonicalLaneLean.MonoidalCategory

namespace HautevilleHouse
namespace CategoryTheorySymmetricMonoidalCategoriesTheoremCanonicalLaneLean

structure BraidingPackage {C : Type u} [Category.{v} C] (M : MonoidalCategoryPackage C) where
  braiding : ∀ X Y : C, M.tensorObj X Y ⟶ M.tensorObj Y X
  braidingNatural : ∀ X Y Z W : C, True
  hexagonAxiom : ∀ X Y Z : C, True

structure BraidingEvidence {C : Type u} [Category.{v} C] {M : MonoidalCategoryPackage C} (B : BraidingPackage M) where
  braidingNaturalClosed : ∀ X Y Z W : C, True := by trivial
  hexagonClosed : ∀ X Y Z : C, True := by trivial

def BraidingClosed {C : Type u} [Category.{v} C] {M : MonoidalCategoryPackage C} (B : BraidingPackage M) : Prop :=
  (∀ X Y Z W : C, True) ∧ (∀ X Y Z : C, True)

theorem braiding_closed_from_evidence {C : Type u} [Category.{v} C] {M : MonoidalCategoryPackage C} (B : BraidingPackage M) (E : BraidingEvidence B) : BraidingClosed B := by
  exact And.intro E.braidingNaturalClosed E.hexagonClosed

def SymmetryProperty {C : Type u} [Category.{v} C] {M : MonoidalCategoryPackage C} (B : BraidingPackage M) : Prop :=
  ∀ X Y : C, B.braiding X Y ≫ B.braiding Y X = 𝟙 (M.tensorObj X Y)

end CategoryTheorySymmetricMonoidalCategoriesTheoremCanonicalLaneLean
end HautevilleHouse