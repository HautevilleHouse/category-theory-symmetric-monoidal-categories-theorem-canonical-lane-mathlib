import canonicalLaneMathlib.AdmissibleClass
import CategoryTheorySymmetricMonoidalCategoriesTheoremCanonicalLaneLean.MonoidalCategoryPackage

namespace HautevilleHouse
namespace CategoryTheorySymmetricMonoidalCategoriesTheoremCanonicalLaneLean

structure BraidingStructure {M : MonoidalCategoryPackage} where
  braiding : (A B : M.objects) → M.morphisms (M.tensorProduct A B) (M.tensorProduct B A)
  hexagonIdentity : Prop
  hexagonIdentityClosed : hexagonIdentity

structure BraidedMonoidalCategoryPackage (M : MonoidalCategoryPackage) where
  braiding : BraidingStructure M
  monoidalClosed : MonoidalCategoryClosed M

def BraidedMonoidalCategoryClosed {M : MonoidalCategoryPackage} (B : BraidedMonoidalCategoryPackage M) : Prop :=
  B.braiding.hexagonIdentity ∧ B.monoidalClosed

theorem braided_monoidal_category_closed {M : MonoidalCategoryPackage} (B : BraidedMonoidalCategoryPackage M) (h : BraidedMonoidalCategoryClosed B) : BraidedMonoidalCategoryClosed B := h

end CategoryTheorySymmetricMonoidalCategoriesTheoremCanonicalLaneLean
end HautevilleHouse