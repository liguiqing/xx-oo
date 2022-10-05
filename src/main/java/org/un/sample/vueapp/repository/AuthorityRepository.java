package org.un.sample.vueapp.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.un.sample.vueapp.domain.Authority;

/**
 * Spring Data JPA repository for the {@link Authority} entity.
 */
public interface AuthorityRepository extends JpaRepository<Authority, String> {}
