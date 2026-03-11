DO $$
DECLARE v_id UUID;
BEGIN
  INSERT INTO engagement_rings (slug, name, title, description, base_price_usd, currency, shape, setting_style, band_type, setting_profile)
  VALUES (
    'ring-caroline',
    'Caroline',
    'Caroline - Round 6 Claw Solitaire with Knife Edge Band Engagement Ring',
    'Arguably the most iconic solitaire design in history, the stunning Caroline engagement ring features a round cut centre stone, high-set 6-claw setting and knife-edge band. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'round'::enum_ring_shape,
    'solitaire'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-caroline';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-caroline-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/caroline/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/caroline/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-caroline-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/caroline/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/caroline/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-caroline-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/caroline/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/caroline/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-caroline-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-caroline-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-caroline-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-caroline-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-caroline-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-caroline-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-caroline-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-caroline-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-caroline-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-caroline-size-0', 1, v_id, 'D'),
      ('ring-caroline-size-1', 2, v_id, 'E'),
      ('ring-caroline-size-2', 3, v_id, 'F'),
      ('ring-caroline-size-3', 4, v_id, 'G'),
      ('ring-caroline-size-4', 5, v_id, 'H'),
      ('ring-caroline-size-5', 6, v_id, 'I'),
      ('ring-caroline-size-6', 7, v_id, 'J'),
      ('ring-caroline-size-7', 8, v_id, 'K'),
      ('ring-caroline-size-8', 9, v_id, 'L'),
      ('ring-caroline-size-9', 10, v_id, 'M'),
      ('ring-caroline-size-10', 11, v_id, 'N'),
      ('ring-caroline-size-11', 12, v_id, 'O'),
      ('ring-caroline-size-12', 13, v_id, 'P'),
      ('ring-caroline-size-13', 14, v_id, 'Q'),
      ('ring-caroline-size-14', 15, v_id, 'R'),
      ('ring-caroline-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-caroline-specs',
      v_id,
      '1.5mm',
      '16',
      '6.5 x 4.5mm',
      NULL,
      '2.8g',
      true
    )
    ON CONFLICT (ring_id) DO NOTHING;
  END IF;
END $$;

DO $$
DECLARE v_id UUID;
BEGIN
  INSERT INTO engagement_rings (slug, name, title, description, base_price_usd, currency, shape, setting_style, band_type, setting_profile)
  VALUES (
    'ring-cartia',
    'Cartia',
    'Cartia - Round Claw Solitaire with Round-Marquise Bezel Accent Stones Engagement Ring',
    'The Cartia design features a 4-claw round cut centre stone, balanced by a sleek band. Bezel-set round and marquise side stones bring subtle dimension and architectural detail to the design. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'round'::enum_ring_shape,
    'bezel'::enum_ring_setting_style,
    'accents'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-cartia';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-cartia-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/cartia/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/cartia/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-cartia-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/cartia/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/cartia/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-cartia-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/cartia/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/cartia/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-cartia-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-cartia-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-cartia-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-cartia-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-cartia-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-cartia-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-cartia-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-cartia-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-cartia-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-cartia-size-0', 1, v_id, 'D'),
      ('ring-cartia-size-1', 2, v_id, 'E'),
      ('ring-cartia-size-2', 3, v_id, 'F'),
      ('ring-cartia-size-3', 4, v_id, 'G'),
      ('ring-cartia-size-4', 5, v_id, 'H'),
      ('ring-cartia-size-5', 6, v_id, 'I'),
      ('ring-cartia-size-6', 7, v_id, 'J'),
      ('ring-cartia-size-7', 8, v_id, 'K'),
      ('ring-cartia-size-8', 9, v_id, 'L'),
      ('ring-cartia-size-9', 10, v_id, 'M'),
      ('ring-cartia-size-10', 11, v_id, 'N'),
      ('ring-cartia-size-11', 12, v_id, 'O'),
      ('ring-cartia-size-12', 13, v_id, 'P'),
      ('ring-cartia-size-13', 14, v_id, 'Q'),
      ('ring-cartia-size-14', 15, v_id, 'R'),
      ('ring-cartia-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-cartia-specs',
      v_id,
      '1.5mm',
      '16',
      '6.5 x 4.5mm',
      NULL,
      '2.8g',
      true
    )
    ON CONFLICT (ring_id) DO NOTHING;
  END IF;
END $$;

DO $$
DECLARE v_id UUID;
BEGIN
  INSERT INTO engagement_rings (slug, name, title, description, base_price_usd, currency, shape, setting_style, band_type, setting_profile)
  VALUES (
    'ring-casey',
    'Casey',
    'Casey - Oval East West Claw Solitaire with Bypass Band  Engagement Ring',
    'Casey centres an oval stone in a four-claw east–west setting, supported by a gently twisting bypass band. Soft curves wrap around the basket, creating a light, contemporary silhouette with sculptural balance. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'oval'::enum_ring_shape,
    'east_west'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-casey';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-casey-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/casey/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/casey/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-casey-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/casey/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/casey/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-casey-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/casey/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/casey/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-casey-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-casey-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-casey-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-casey-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-casey-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-casey-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-casey-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-casey-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-casey-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-casey-size-0', 1, v_id, 'D'),
      ('ring-casey-size-1', 2, v_id, 'E'),
      ('ring-casey-size-2', 3, v_id, 'F'),
      ('ring-casey-size-3', 4, v_id, 'G'),
      ('ring-casey-size-4', 5, v_id, 'H'),
      ('ring-casey-size-5', 6, v_id, 'I'),
      ('ring-casey-size-6', 7, v_id, 'J'),
      ('ring-casey-size-7', 8, v_id, 'K'),
      ('ring-casey-size-8', 9, v_id, 'L'),
      ('ring-casey-size-9', 10, v_id, 'M'),
      ('ring-casey-size-10', 11, v_id, 'N'),
      ('ring-casey-size-11', 12, v_id, 'O'),
      ('ring-casey-size-12', 13, v_id, 'P'),
      ('ring-casey-size-13', 14, v_id, 'Q'),
      ('ring-casey-size-14', 15, v_id, 'R'),
      ('ring-casey-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-casey-specs',
      v_id,
      '1.5mm',
      '16',
      '6.5 x 4.5mm',
      NULL,
      '2.8g',
      true
    )
    ON CONFLICT (ring_id) DO NOTHING;
  END IF;
END $$;

DO $$
DECLARE v_id UUID;
BEGIN
  INSERT INTO engagement_rings (slug, name, title, description, base_price_usd, currency, shape, setting_style, band_type, setting_profile)
  VALUES (
    'ring-cataleya',
    'Cataleya',
    'Cataleya - Elongated Cushion 4 Claw Trilogy with Pear Side Stones and Cathedral Setting Engagement Ring',
    'Cataleya is a stunning elongated cushion trilogy with pear cut side stones and cathedral arches. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'elongated_cushion'::enum_ring_shape,
    'trilogy'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-cataleya';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-cataleya-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/cataleya/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/cataleya/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-cataleya-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/cataleya/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/cataleya/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-cataleya-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/cataleya/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/cataleya/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-cataleya-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-cataleya-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-cataleya-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-cataleya-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-cataleya-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-cataleya-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-cataleya-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-cataleya-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-cataleya-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-cataleya-size-0', 1, v_id, 'D'),
      ('ring-cataleya-size-1', 2, v_id, 'E'),
      ('ring-cataleya-size-2', 3, v_id, 'F'),
      ('ring-cataleya-size-3', 4, v_id, 'G'),
      ('ring-cataleya-size-4', 5, v_id, 'H'),
      ('ring-cataleya-size-5', 6, v_id, 'I'),
      ('ring-cataleya-size-6', 7, v_id, 'J'),
      ('ring-cataleya-size-7', 8, v_id, 'K'),
      ('ring-cataleya-size-8', 9, v_id, 'L'),
      ('ring-cataleya-size-9', 10, v_id, 'M'),
      ('ring-cataleya-size-10', 11, v_id, 'N'),
      ('ring-cataleya-size-11', 12, v_id, 'O'),
      ('ring-cataleya-size-12', 13, v_id, 'P'),
      ('ring-cataleya-size-13', 14, v_id, 'Q'),
      ('ring-cataleya-size-14', 15, v_id, 'R'),
      ('ring-cataleya-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-cataleya-specs',
      v_id,
      '1.5mm',
      '16',
      '6.5 x 4.5mm',
      NULL,
      '2.8g',
      true
    )
    ON CONFLICT (ring_id) DO NOTHING;
  END IF;
END $$;

DO $$
DECLARE v_id UUID;
BEGIN
  INSERT INTO engagement_rings (slug, name, title, description, base_price_usd, currency, shape, setting_style, band_type, setting_profile)
  VALUES (
    'ring-cecilia',
    'Cecilia',
    'Cecilia - Oval 4 Claw Solitaire with Wrap Around Hidden Halo Engagement Ring',
    'The elegant Cecilia engagement ring is a 4-claw oval solitaire with a dazzling wrap-around halo. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'oval'::enum_ring_shape,
    'halo'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-cecilia';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-cecilia-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/cecilia/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/cecilia/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-cecilia-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/cecilia/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/cecilia/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-cecilia-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/cecilia/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/cecilia/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-cecilia-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-cecilia-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-cecilia-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-cecilia-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-cecilia-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-cecilia-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-cecilia-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-cecilia-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-cecilia-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-cecilia-size-0', 1, v_id, 'D'),
      ('ring-cecilia-size-1', 2, v_id, 'E'),
      ('ring-cecilia-size-2', 3, v_id, 'F'),
      ('ring-cecilia-size-3', 4, v_id, 'G'),
      ('ring-cecilia-size-4', 5, v_id, 'H'),
      ('ring-cecilia-size-5', 6, v_id, 'I'),
      ('ring-cecilia-size-6', 7, v_id, 'J'),
      ('ring-cecilia-size-7', 8, v_id, 'K'),
      ('ring-cecilia-size-8', 9, v_id, 'L'),
      ('ring-cecilia-size-9', 10, v_id, 'M'),
      ('ring-cecilia-size-10', 11, v_id, 'N'),
      ('ring-cecilia-size-11', 12, v_id, 'O'),
      ('ring-cecilia-size-12', 13, v_id, 'P'),
      ('ring-cecilia-size-13', 14, v_id, 'Q'),
      ('ring-cecilia-size-14', 15, v_id, 'R'),
      ('ring-cecilia-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-cecilia-specs',
      v_id,
      '1.5mm',
      '16',
      '6.5 x 4.5mm',
      NULL,
      '2.8g',
      true
    )
    ON CONFLICT (ring_id) DO NOTHING;
  END IF;
END $$;