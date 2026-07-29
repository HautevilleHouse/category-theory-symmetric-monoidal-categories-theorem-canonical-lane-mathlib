import canonicalLaneMathlib.AdmissibleClass

/-!
# Yoneda Embedding Package
-/

namespace HautevilleHouse
namespace CategoryTheorySymmetricMonoidalCategoriesTheoremCanonicalLaneLean

structure YonedaEmbeddingPackage (C : SymmetricMonoidalCategoryPackage) where
  yonedaFunctor : C.underlyingCategory -> (C.underlyingCategory -> Type) -> Type
  fullyFaithful : Prop
  representationTheorem : Prop
  naturality : Prop

structure YonedaEmbeddingEvidence {C : SymmetricMonoidalCategoryPackage}
    (Y : YonedaEmbeddingPackage C) where
  fullyFaithfulClosed : Y.fullyFaithful
  representationTheoremClosed : Y.representationTheorem
  naturalityClosed : Y.naturality

def YonedaEmbeddingClosed {C : SymmetricMonoidalCategoryPackage}
    (Y : YonedaEmbeddingPackage C) : Prop :=
  Y.fullyFaithful ∧ Y.representationTheorem ∧ Y.naturality

theorem yoneda_embedding_closed_from_evidence
    {C : SymmetricMonoidalCategoryPackage} (Y : YonedaEmbeddingPackage C)
    (E : YonedaEmbeddingEvidence Y) : YonedaEmbeddingClosed Y := by
  exact And.intro E.fullyFaithfulClosed
    (And.intro E.representationTheoremClosed E.naturalityClosed)

end CategoryTheorySymmetricMonoidalCategoriesTheoremCanonicalLaneLean
end HautevilleHouse