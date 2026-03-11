DO $$
DECLARE v_id UUID;
BEGIN
  INSERT INTO engagement_rings (slug, name, title, description, base_price_usd, currency, shape, setting_style, band_type, setting_profile)
  VALUES (
    'ring-siobhan',
    'Siobhan',
    'Siobhan - Round Claw Solitaire with Hidden Halo, Pave Collar and Pave Band Engagement Ring',
    'Siobhan is a beautiful 6-claw round solitaire with a sparkling hidden halo and collar placed atop a 2/3 pavé band. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'round'::enum_ring_shape,
    'halo'::enum_ring_setting_style,
    'pave'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-siobhan';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-siobhan-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/siobhan/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/siobhan/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-siobhan-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/siobhan/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/siobhan/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-siobhan-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/siobhan/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/siobhan/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-siobhan-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-siobhan-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-siobhan-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-siobhan-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-siobhan-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-siobhan-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-siobhan-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-siobhan-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-siobhan-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-siobhan-size-0', 1, v_id, 'D'),
      ('ring-siobhan-size-1', 2, v_id, 'E'),
      ('ring-siobhan-size-2', 3, v_id, 'F'),
      ('ring-siobhan-size-3', 4, v_id, 'G'),
      ('ring-siobhan-size-4', 5, v_id, 'H'),
      ('ring-siobhan-size-5', 6, v_id, 'I'),
      ('ring-siobhan-size-6', 7, v_id, 'J'),
      ('ring-siobhan-size-7', 8, v_id, 'K'),
      ('ring-siobhan-size-8', 9, v_id, 'L'),
      ('ring-siobhan-size-9', 10, v_id, 'M'),
      ('ring-siobhan-size-10', 11, v_id, 'N'),
      ('ring-siobhan-size-11', 12, v_id, 'O'),
      ('ring-siobhan-size-12', 13, v_id, 'P'),
      ('ring-siobhan-size-13', 14, v_id, 'Q'),
      ('ring-siobhan-size-14', 15, v_id, 'R'),
      ('ring-siobhan-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-siobhan-specs',
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
    'ring-sophia',
    'Sophia',
    'Sophia - Princess 4 Claw Solitaire with Angled Setting and Clustered Round Shoulder Stones Engagement Ring',
    'The Sophia engagement ring is a beautiful princess solitaire design characterised by a distinct pattern of dainty round cut accent stones set low on a polished band. Schedule an appointment with Cullen US today.',
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
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-sophia';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-sophia-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/sophia/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/sophia/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-sophia-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/sophia/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/sophia/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-sophia-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/sophia/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/sophia/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-sophia-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-sophia-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-sophia-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-sophia-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-sophia-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-sophia-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-sophia-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-sophia-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-sophia-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-sophia-size-0', 1, v_id, 'D'),
      ('ring-sophia-size-1', 2, v_id, 'E'),
      ('ring-sophia-size-2', 3, v_id, 'F'),
      ('ring-sophia-size-3', 4, v_id, 'G'),
      ('ring-sophia-size-4', 5, v_id, 'H'),
      ('ring-sophia-size-5', 6, v_id, 'I'),
      ('ring-sophia-size-6', 7, v_id, 'J'),
      ('ring-sophia-size-7', 8, v_id, 'K'),
      ('ring-sophia-size-8', 9, v_id, 'L'),
      ('ring-sophia-size-9', 10, v_id, 'M'),
      ('ring-sophia-size-10', 11, v_id, 'N'),
      ('ring-sophia-size-11', 12, v_id, 'O'),
      ('ring-sophia-size-12', 13, v_id, 'P'),
      ('ring-sophia-size-13', 14, v_id, 'Q'),
      ('ring-sophia-size-14', 15, v_id, 'R'),
      ('ring-sophia-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-sophia-specs',
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
    'ring-soraya',
    'Soraya',
    'Soraya - Oval Offset East West Claw Solitaire with Flat Cigar Band  Engagement Ring',
    'Soraya is a statement engagement ring with a breathtaking east-west oval solitaire held by four round claws on a bold cigar band. Schedule an appointment with Cullen US today.',
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
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-soraya';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-soraya-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/soraya/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/soraya/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-soraya-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/soraya/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/soraya/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-soraya-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/soraya/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/soraya/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-soraya-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-soraya-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-soraya-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-soraya-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-soraya-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-soraya-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-soraya-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-soraya-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-soraya-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-soraya-size-0', 1, v_id, 'D'),
      ('ring-soraya-size-1', 2, v_id, 'E'),
      ('ring-soraya-size-2', 3, v_id, 'F'),
      ('ring-soraya-size-3', 4, v_id, 'G'),
      ('ring-soraya-size-4', 5, v_id, 'H'),
      ('ring-soraya-size-5', 6, v_id, 'I'),
      ('ring-soraya-size-6', 7, v_id, 'J'),
      ('ring-soraya-size-7', 8, v_id, 'K'),
      ('ring-soraya-size-8', 9, v_id, 'L'),
      ('ring-soraya-size-9', 10, v_id, 'M'),
      ('ring-soraya-size-10', 11, v_id, 'N'),
      ('ring-soraya-size-11', 12, v_id, 'O'),
      ('ring-soraya-size-12', 13, v_id, 'P'),
      ('ring-soraya-size-13', 14, v_id, 'Q'),
      ('ring-soraya-size-14', 15, v_id, 'R'),
      ('ring-soraya-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-soraya-specs',
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
    'ring-stephanie',
    'Stephanie',
    'Stephanie - Marquise 4 Claw Solitaire Engagement Ring',
    'The Stephanie engagement ring is a classic 6-claw solitaire design, featuring a striking marquise cut centre stone set low on a sleek band. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'marquise'::enum_ring_shape,
    'solitaire'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-stephanie';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-stephanie-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/stephanie/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/stephanie/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-stephanie-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/stephanie/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/stephanie/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-stephanie-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/stephanie/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/stephanie/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-stephanie-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-stephanie-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-stephanie-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-stephanie-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-stephanie-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-stephanie-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-stephanie-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-stephanie-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-stephanie-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-stephanie-size-0', 1, v_id, 'D'),
      ('ring-stephanie-size-1', 2, v_id, 'E'),
      ('ring-stephanie-size-2', 3, v_id, 'F'),
      ('ring-stephanie-size-3', 4, v_id, 'G'),
      ('ring-stephanie-size-4', 5, v_id, 'H'),
      ('ring-stephanie-size-5', 6, v_id, 'I'),
      ('ring-stephanie-size-6', 7, v_id, 'J'),
      ('ring-stephanie-size-7', 8, v_id, 'K'),
      ('ring-stephanie-size-8', 9, v_id, 'L'),
      ('ring-stephanie-size-9', 10, v_id, 'M'),
      ('ring-stephanie-size-10', 11, v_id, 'N'),
      ('ring-stephanie-size-11', 12, v_id, 'O'),
      ('ring-stephanie-size-12', 13, v_id, 'P'),
      ('ring-stephanie-size-13', 14, v_id, 'Q'),
      ('ring-stephanie-size-14', 15, v_id, 'R'),
      ('ring-stephanie-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-stephanie-specs',
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
    'ring-suki',
    'Suki',
    'Suki - Pear East West Claw Solitaire with Raised Basket Gallery Engagement Ring',
    'Suki features an east-west set pear-cut centre stone, positioned low within a scooped basket. The design sits flush with a classic band for a clean, seamless profile. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'pear'::enum_ring_shape,
    'east_west'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-suki';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-suki-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/suki/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/suki/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-suki-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/suki/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/suki/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-suki-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/suki/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/suki/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-suki-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-suki-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-suki-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-suki-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-suki-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-suki-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-suki-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-suki-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-suki-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-suki-size-0', 1, v_id, 'D'),
      ('ring-suki-size-1', 2, v_id, 'E'),
      ('ring-suki-size-2', 3, v_id, 'F'),
      ('ring-suki-size-3', 4, v_id, 'G'),
      ('ring-suki-size-4', 5, v_id, 'H'),
      ('ring-suki-size-5', 6, v_id, 'I'),
      ('ring-suki-size-6', 7, v_id, 'J'),
      ('ring-suki-size-7', 8, v_id, 'K'),
      ('ring-suki-size-8', 9, v_id, 'L'),
      ('ring-suki-size-9', 10, v_id, 'M'),
      ('ring-suki-size-10', 11, v_id, 'N'),
      ('ring-suki-size-11', 12, v_id, 'O'),
      ('ring-suki-size-12', 13, v_id, 'P'),
      ('ring-suki-size-13', 14, v_id, 'Q'),
      ('ring-suki-size-14', 15, v_id, 'R'),
      ('ring-suki-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-suki-specs',
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
    'ring-svea',
    'Svea',
    'Svea - Pear and Princess Claw Toi et Moi Engagement Ring',
    'Svea is a breathtaking toi et moi engagement ring featuring pear and princess cut centre stones. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'pear'::enum_ring_shape,
    'toi_et_moi'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-svea';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-svea-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/svea/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/svea/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-svea-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/svea/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/svea/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-svea-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/svea/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/svea/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-svea-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-svea-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-svea-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-svea-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-svea-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-svea-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-svea-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-svea-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-svea-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-svea-size-0', 1, v_id, 'D'),
      ('ring-svea-size-1', 2, v_id, 'E'),
      ('ring-svea-size-2', 3, v_id, 'F'),
      ('ring-svea-size-3', 4, v_id, 'G'),
      ('ring-svea-size-4', 5, v_id, 'H'),
      ('ring-svea-size-5', 6, v_id, 'I'),
      ('ring-svea-size-6', 7, v_id, 'J'),
      ('ring-svea-size-7', 8, v_id, 'K'),
      ('ring-svea-size-8', 9, v_id, 'L'),
      ('ring-svea-size-9', 10, v_id, 'M'),
      ('ring-svea-size-10', 11, v_id, 'N'),
      ('ring-svea-size-11', 12, v_id, 'O'),
      ('ring-svea-size-12', 13, v_id, 'P'),
      ('ring-svea-size-13', 14, v_id, 'Q'),
      ('ring-svea-size-14', 15, v_id, 'R'),
      ('ring-svea-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-svea-specs',
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
    'ring-tahlia',
    'Tahlia',
    'Tahlia - Emerald and Pear Claw Toi et Moi with Hidden Halo Engagement Ring',
    'Tahlia is a classic toi et moi engagement ring with a high-set duo of pear and emerald cut stones and matching hidden halos. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'emerald'::enum_ring_shape,
    'halo'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-tahlia';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-tahlia-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/tahlia/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/tahlia/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-tahlia-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/tahlia/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/tahlia/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-tahlia-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/tahlia/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/tahlia/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-tahlia-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-tahlia-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-tahlia-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-tahlia-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-tahlia-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-tahlia-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-tahlia-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-tahlia-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-tahlia-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-tahlia-size-0', 1, v_id, 'D'),
      ('ring-tahlia-size-1', 2, v_id, 'E'),
      ('ring-tahlia-size-2', 3, v_id, 'F'),
      ('ring-tahlia-size-3', 4, v_id, 'G'),
      ('ring-tahlia-size-4', 5, v_id, 'H'),
      ('ring-tahlia-size-5', 6, v_id, 'I'),
      ('ring-tahlia-size-6', 7, v_id, 'J'),
      ('ring-tahlia-size-7', 8, v_id, 'K'),
      ('ring-tahlia-size-8', 9, v_id, 'L'),
      ('ring-tahlia-size-9', 10, v_id, 'M'),
      ('ring-tahlia-size-10', 11, v_id, 'N'),
      ('ring-tahlia-size-11', 12, v_id, 'O'),
      ('ring-tahlia-size-12', 13, v_id, 'P'),
      ('ring-tahlia-size-13', 14, v_id, 'Q'),
      ('ring-tahlia-size-14', 15, v_id, 'R'),
      ('ring-tahlia-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-tahlia-specs',
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
    'ring-tanya',
    'Tanya',
    'Tanya - Oval and Emerald Claw Toi et Moi Engagement Ring',
    'Tanya is a timeless toi et moi design featuring oval cut and emerald cut centre stones, each held by four eagle-tipped claws. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'oval'::enum_ring_shape,
    'toi_et_moi'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-tanya';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-tanya-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/tanya/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/tanya/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-tanya-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/tanya/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/tanya/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-tanya-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/tanya/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/tanya/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-tanya-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-tanya-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-tanya-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-tanya-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-tanya-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-tanya-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-tanya-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-tanya-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-tanya-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-tanya-size-0', 1, v_id, 'D'),
      ('ring-tanya-size-1', 2, v_id, 'E'),
      ('ring-tanya-size-2', 3, v_id, 'F'),
      ('ring-tanya-size-3', 4, v_id, 'G'),
      ('ring-tanya-size-4', 5, v_id, 'H'),
      ('ring-tanya-size-5', 6, v_id, 'I'),
      ('ring-tanya-size-6', 7, v_id, 'J'),
      ('ring-tanya-size-7', 8, v_id, 'K'),
      ('ring-tanya-size-8', 9, v_id, 'L'),
      ('ring-tanya-size-9', 10, v_id, 'M'),
      ('ring-tanya-size-10', 11, v_id, 'N'),
      ('ring-tanya-size-11', 12, v_id, 'O'),
      ('ring-tanya-size-12', 13, v_id, 'P'),
      ('ring-tanya-size-13', 14, v_id, 'Q'),
      ('ring-tanya-size-14', 15, v_id, 'R'),
      ('ring-tanya-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-tanya-specs',
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
    'ring-taylor',
    'Taylor',
    'Taylor - Vintage Style Elongated Cushion Claw Solitaire with Bezel Frame and Star Set Accent Stones and Milgrain Engagement Ring',
    'Taylor pairs an elongated cushion-cut centre stone with a bezel frame and four claws. Star-set side stones accent the shoulders, while a tapered band with milgrain detailing defines a refined, vintage-inspired design. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'elongated_cushion'::enum_ring_shape,
    'bezel'::enum_ring_setting_style,
    'accents'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-taylor';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-taylor-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/taylor/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/taylor/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-taylor-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/taylor/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/taylor/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-taylor-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/taylor/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/taylor/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-taylor-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-taylor-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-taylor-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-taylor-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-taylor-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-taylor-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-taylor-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-taylor-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-taylor-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-taylor-size-0', 1, v_id, 'D'),
      ('ring-taylor-size-1', 2, v_id, 'E'),
      ('ring-taylor-size-2', 3, v_id, 'F'),
      ('ring-taylor-size-3', 4, v_id, 'G'),
      ('ring-taylor-size-4', 5, v_id, 'H'),
      ('ring-taylor-size-5', 6, v_id, 'I'),
      ('ring-taylor-size-6', 7, v_id, 'J'),
      ('ring-taylor-size-7', 8, v_id, 'K'),
      ('ring-taylor-size-8', 9, v_id, 'L'),
      ('ring-taylor-size-9', 10, v_id, 'M'),
      ('ring-taylor-size-10', 11, v_id, 'N'),
      ('ring-taylor-size-11', 12, v_id, 'O'),
      ('ring-taylor-size-12', 13, v_id, 'P'),
      ('ring-taylor-size-13', 14, v_id, 'Q'),
      ('ring-taylor-size-14', 15, v_id, 'R'),
      ('ring-taylor-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-taylor-specs',
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
    'ring-tessa',
    'Tessa',
    'Tessa - Round 6 Claw Solitaire with Petal Gallery and Tapered Band Engagement Ring',
    'The beautiful Tessa engagement ring features a round cut centre stone held in a charming 6-claw tulip-style setting atop a slim tapered band. Schedule an appointment with Cullen US today.',
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
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-tessa';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-tessa-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/tessa/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/tessa/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-tessa-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/tessa/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/tessa/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-tessa-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/tessa/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/tessa/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-tessa-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-tessa-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-tessa-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-tessa-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-tessa-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-tessa-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-tessa-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-tessa-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-tessa-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-tessa-size-0', 1, v_id, 'D'),
      ('ring-tessa-size-1', 2, v_id, 'E'),
      ('ring-tessa-size-2', 3, v_id, 'F'),
      ('ring-tessa-size-3', 4, v_id, 'G'),
      ('ring-tessa-size-4', 5, v_id, 'H'),
      ('ring-tessa-size-5', 6, v_id, 'I'),
      ('ring-tessa-size-6', 7, v_id, 'J'),
      ('ring-tessa-size-7', 8, v_id, 'K'),
      ('ring-tessa-size-8', 9, v_id, 'L'),
      ('ring-tessa-size-9', 10, v_id, 'M'),
      ('ring-tessa-size-10', 11, v_id, 'N'),
      ('ring-tessa-size-11', 12, v_id, 'O'),
      ('ring-tessa-size-12', 13, v_id, 'P'),
      ('ring-tessa-size-13', 14, v_id, 'Q'),
      ('ring-tessa-size-14', 15, v_id, 'R'),
      ('ring-tessa-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-tessa-specs',
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
    'ring-thea',
    'Thea',
    'Thea - Radiant 4 Claw Solitaire with Hidden Halo and Pave Band Engagement Ring',
    'Thea is a sophisticated 4-claw radiant solitaire engagement ring with the added sparkle of a hidden halo and 2/3 pavé band. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'radiant'::enum_ring_shape,
    'halo'::enum_ring_setting_style,
    'pave'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-thea';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-thea-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/thea/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/thea/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-thea-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/thea/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/thea/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-thea-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/thea/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/thea/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-thea-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-thea-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-thea-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-thea-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-thea-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-thea-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-thea-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-thea-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-thea-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-thea-size-0', 1, v_id, 'D'),
      ('ring-thea-size-1', 2, v_id, 'E'),
      ('ring-thea-size-2', 3, v_id, 'F'),
      ('ring-thea-size-3', 4, v_id, 'G'),
      ('ring-thea-size-4', 5, v_id, 'H'),
      ('ring-thea-size-5', 6, v_id, 'I'),
      ('ring-thea-size-6', 7, v_id, 'J'),
      ('ring-thea-size-7', 8, v_id, 'K'),
      ('ring-thea-size-8', 9, v_id, 'L'),
      ('ring-thea-size-9', 10, v_id, 'M'),
      ('ring-thea-size-10', 11, v_id, 'N'),
      ('ring-thea-size-11', 12, v_id, 'O'),
      ('ring-thea-size-12', 13, v_id, 'P'),
      ('ring-thea-size-13', 14, v_id, 'Q'),
      ('ring-thea-size-14', 15, v_id, 'R'),
      ('ring-thea-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-thea-specs',
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
    'ring-tilly',
    'Tilly',
    'Tilly - Elongated Cushion Claw Solitaire with Petal Gallery and Accent Leaf Detail Engagement Ring',
    'Tilly is a 4-claw elongated cushion that offers a twist on a classic solitaire with an accented petal gallery. Emphasising beauty in the smallest details, a secret hidden halo is encased within the petite petals, offering support for a subtle yet elegant form. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'elongated_cushion'::enum_ring_shape,
    'solitaire'::enum_ring_setting_style,
    'accents'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-tilly';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-tilly-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/tilly/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/tilly/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-tilly-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/tilly/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/tilly/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-tilly-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/tilly/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/tilly/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-tilly-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-tilly-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-tilly-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-tilly-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-tilly-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-tilly-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-tilly-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-tilly-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-tilly-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-tilly-size-0', 1, v_id, 'D'),
      ('ring-tilly-size-1', 2, v_id, 'E'),
      ('ring-tilly-size-2', 3, v_id, 'F'),
      ('ring-tilly-size-3', 4, v_id, 'G'),
      ('ring-tilly-size-4', 5, v_id, 'H'),
      ('ring-tilly-size-5', 6, v_id, 'I'),
      ('ring-tilly-size-6', 7, v_id, 'J'),
      ('ring-tilly-size-7', 8, v_id, 'K'),
      ('ring-tilly-size-8', 9, v_id, 'L'),
      ('ring-tilly-size-9', 10, v_id, 'M'),
      ('ring-tilly-size-10', 11, v_id, 'N'),
      ('ring-tilly-size-11', 12, v_id, 'O'),
      ('ring-tilly-size-12', 13, v_id, 'P'),
      ('ring-tilly-size-13', 14, v_id, 'Q'),
      ('ring-tilly-size-14', 15, v_id, 'R'),
      ('ring-tilly-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-tilly-specs',
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
    'ring-trinity',
    'Trinity',
    'Trinity - Oval 4 Claw Solitaire with Twisted Band Engagement Ring',
    'Trinity features a gently twisted band leading to an oval centre stone held in a four-claw setting. A subtle hidden halo sits beneath, adding refined structural detail to this considered solitaire. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'oval'::enum_ring_shape,
    'solitaire'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-trinity';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-trinity-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/trinity/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/trinity/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-trinity-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/trinity/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/trinity/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-trinity-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/trinity/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/trinity/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-trinity-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-trinity-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-trinity-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-trinity-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-trinity-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-trinity-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-trinity-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-trinity-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-trinity-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-trinity-size-0', 1, v_id, 'D'),
      ('ring-trinity-size-1', 2, v_id, 'E'),
      ('ring-trinity-size-2', 3, v_id, 'F'),
      ('ring-trinity-size-3', 4, v_id, 'G'),
      ('ring-trinity-size-4', 5, v_id, 'H'),
      ('ring-trinity-size-5', 6, v_id, 'I'),
      ('ring-trinity-size-6', 7, v_id, 'J'),
      ('ring-trinity-size-7', 8, v_id, 'K'),
      ('ring-trinity-size-8', 9, v_id, 'L'),
      ('ring-trinity-size-9', 10, v_id, 'M'),
      ('ring-trinity-size-10', 11, v_id, 'N'),
      ('ring-trinity-size-11', 12, v_id, 'O'),
      ('ring-trinity-size-12', 13, v_id, 'P'),
      ('ring-trinity-size-13', 14, v_id, 'Q'),
      ('ring-trinity-size-14', 15, v_id, 'R'),
      ('ring-trinity-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-trinity-specs',
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
    'ring-valeria',
    'Valeria',
    'Valeria - Emerald Bezel Solitaire with Hidden Halo and Cathedral Setting Engagement Ring',
    'Valeria is a modern interpretation of the bezel design, encapsulating an emerald-cut centre stone within a deep setting. A hidden pavé detail sits within the bezel, supported by a cathedral foundation for balanced structure. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'emerald'::enum_ring_shape,
    'halo'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-valeria';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-valeria-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/valeria/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/valeria/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-valeria-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/valeria/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/valeria/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-valeria-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/valeria/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/valeria/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-valeria-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-valeria-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-valeria-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-valeria-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-valeria-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-valeria-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-valeria-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-valeria-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-valeria-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-valeria-size-0', 1, v_id, 'D'),
      ('ring-valeria-size-1', 2, v_id, 'E'),
      ('ring-valeria-size-2', 3, v_id, 'F'),
      ('ring-valeria-size-3', 4, v_id, 'G'),
      ('ring-valeria-size-4', 5, v_id, 'H'),
      ('ring-valeria-size-5', 6, v_id, 'I'),
      ('ring-valeria-size-6', 7, v_id, 'J'),
      ('ring-valeria-size-7', 8, v_id, 'K'),
      ('ring-valeria-size-8', 9, v_id, 'L'),
      ('ring-valeria-size-9', 10, v_id, 'M'),
      ('ring-valeria-size-10', 11, v_id, 'N'),
      ('ring-valeria-size-11', 12, v_id, 'O'),
      ('ring-valeria-size-12', 13, v_id, 'P'),
      ('ring-valeria-size-13', 14, v_id, 'Q'),
      ('ring-valeria-size-14', 15, v_id, 'R'),
      ('ring-valeria-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-valeria-specs',
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
    'ring-violetta',
    'Violetta',
    'Violetta - Elongated Cushion Claw Solitaire with Hidden Halo and Twisted Alternating Pave Band Engagement Ring',
    'Violetta is an elegant twisted engagement ring, where sleek pavé and polished metal intertwine in a refined half-circle. A 4-claw elongated cushion centre stone is illuminated by a hidden halo beneath Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'elongated_cushion'::enum_ring_shape,
    'halo'::enum_ring_setting_style,
    'pave'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-violetta';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-violetta-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/violetta/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/violetta/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-violetta-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/violetta/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/violetta/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-violetta-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/violetta/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/violetta/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-violetta-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-violetta-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-violetta-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-violetta-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-violetta-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-violetta-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-violetta-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-violetta-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-violetta-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-violetta-size-0', 1, v_id, 'D'),
      ('ring-violetta-size-1', 2, v_id, 'E'),
      ('ring-violetta-size-2', 3, v_id, 'F'),
      ('ring-violetta-size-3', 4, v_id, 'G'),
      ('ring-violetta-size-4', 5, v_id, 'H'),
      ('ring-violetta-size-5', 6, v_id, 'I'),
      ('ring-violetta-size-6', 7, v_id, 'J'),
      ('ring-violetta-size-7', 8, v_id, 'K'),
      ('ring-violetta-size-8', 9, v_id, 'L'),
      ('ring-violetta-size-9', 10, v_id, 'M'),
      ('ring-violetta-size-10', 11, v_id, 'N'),
      ('ring-violetta-size-11', 12, v_id, 'O'),
      ('ring-violetta-size-12', 13, v_id, 'P'),
      ('ring-violetta-size-13', 14, v_id, 'Q'),
      ('ring-violetta-size-14', 15, v_id, 'R'),
      ('ring-violetta-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-violetta-specs',
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
    'ring-wanda',
    'Wanda',
    'Wanda - Elongated Hexagon 6 Claw Trilogy with Kite Side Stones Engagement Ring',
    'The Wanda engagement ring is a striking trilogy design featuring a 6-claw step-cut elongated hexagon, two kite side stones and sweeping cathedral arches. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'elongated_hexagon'::enum_ring_shape,
    'trilogy'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-wanda';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-wanda-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/wanda/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/wanda/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-wanda-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/wanda/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/wanda/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-wanda-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/wanda/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/wanda/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-wanda-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-wanda-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-wanda-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-wanda-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-wanda-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-wanda-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-wanda-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-wanda-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-wanda-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-wanda-size-0', 1, v_id, 'D'),
      ('ring-wanda-size-1', 2, v_id, 'E'),
      ('ring-wanda-size-2', 3, v_id, 'F'),
      ('ring-wanda-size-3', 4, v_id, 'G'),
      ('ring-wanda-size-4', 5, v_id, 'H'),
      ('ring-wanda-size-5', 6, v_id, 'I'),
      ('ring-wanda-size-6', 7, v_id, 'J'),
      ('ring-wanda-size-7', 8, v_id, 'K'),
      ('ring-wanda-size-8', 9, v_id, 'L'),
      ('ring-wanda-size-9', 10, v_id, 'M'),
      ('ring-wanda-size-10', 11, v_id, 'N'),
      ('ring-wanda-size-11', 12, v_id, 'O'),
      ('ring-wanda-size-12', 13, v_id, 'P'),
      ('ring-wanda-size-13', 14, v_id, 'Q'),
      ('ring-wanda-size-14', 15, v_id, 'R'),
      ('ring-wanda-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-wanda-specs',
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
    'ring-wendy',
    'Wendy',
    'Wendy - Elongated Cushion 4 Claw Solitaire with Hidden Halo, Tapered Band and Cathedral Setting Engagement Ring',
    'The Wendy engagement ring is a beautiful 4-claw elongated cushion design characterised by a sparkling hidden halo and slim tapered cathedral band. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'elongated_cushion'::enum_ring_shape,
    'halo'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-wendy';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-wendy-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/wendy/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/wendy/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-wendy-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/wendy/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/wendy/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-wendy-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/wendy/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/wendy/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-wendy-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-wendy-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-wendy-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-wendy-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-wendy-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-wendy-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-wendy-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-wendy-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-wendy-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-wendy-size-0', 1, v_id, 'D'),
      ('ring-wendy-size-1', 2, v_id, 'E'),
      ('ring-wendy-size-2', 3, v_id, 'F'),
      ('ring-wendy-size-3', 4, v_id, 'G'),
      ('ring-wendy-size-4', 5, v_id, 'H'),
      ('ring-wendy-size-5', 6, v_id, 'I'),
      ('ring-wendy-size-6', 7, v_id, 'J'),
      ('ring-wendy-size-7', 8, v_id, 'K'),
      ('ring-wendy-size-8', 9, v_id, 'L'),
      ('ring-wendy-size-9', 10, v_id, 'M'),
      ('ring-wendy-size-10', 11, v_id, 'N'),
      ('ring-wendy-size-11', 12, v_id, 'O'),
      ('ring-wendy-size-12', 13, v_id, 'P'),
      ('ring-wendy-size-13', 14, v_id, 'Q'),
      ('ring-wendy-size-14', 15, v_id, 'R'),
      ('ring-wendy-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-wendy-specs',
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
    'ring-willow',
    'Willow',
    'Willow - Radiant 4 Claw Solitaire with Clustered Round Shoulder Stones Engagement Ring',
    'Willow features a radiant-cut centre stone set within a basket setting, accented by a subtle cluster of brilliant round stones. The design balances fine detail with a clean, considered silhouette. Schedule an appointment with Cullen US today.',
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
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-willow';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-willow-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/willow/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/willow/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-willow-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/willow/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/willow/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-willow-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/willow/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/willow/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-willow-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-willow-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-willow-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-willow-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-willow-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-willow-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-willow-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-willow-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-willow-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-willow-size-0', 1, v_id, 'D'),
      ('ring-willow-size-1', 2, v_id, 'E'),
      ('ring-willow-size-2', 3, v_id, 'F'),
      ('ring-willow-size-3', 4, v_id, 'G'),
      ('ring-willow-size-4', 5, v_id, 'H'),
      ('ring-willow-size-5', 6, v_id, 'I'),
      ('ring-willow-size-6', 7, v_id, 'J'),
      ('ring-willow-size-7', 8, v_id, 'K'),
      ('ring-willow-size-8', 9, v_id, 'L'),
      ('ring-willow-size-9', 10, v_id, 'M'),
      ('ring-willow-size-10', 11, v_id, 'N'),
      ('ring-willow-size-11', 12, v_id, 'O'),
      ('ring-willow-size-12', 13, v_id, 'P'),
      ('ring-willow-size-13', 14, v_id, 'Q'),
      ('ring-willow-size-14', 15, v_id, 'R'),
      ('ring-willow-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-willow-specs',
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
    'ring-winnie',
    'Winnie',
    'Winnie - Elongated Cushion 4 Claw Solitaire with Clustered Round Shoulder Stones Engagement Ring',
    'The Winnie is a charming basket-set elongated cushion design with a glamorous array of round accent stones adorning the centrepiece. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'elongated_cushion'::enum_ring_shape,
    'solitaire'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-winnie';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-winnie-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/winnie/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/winnie/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-winnie-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/winnie/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/winnie/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-winnie-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/winnie/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/winnie/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-winnie-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-winnie-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-winnie-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-winnie-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-winnie-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-winnie-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-winnie-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-winnie-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-winnie-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-winnie-size-0', 1, v_id, 'D'),
      ('ring-winnie-size-1', 2, v_id, 'E'),
      ('ring-winnie-size-2', 3, v_id, 'F'),
      ('ring-winnie-size-3', 4, v_id, 'G'),
      ('ring-winnie-size-4', 5, v_id, 'H'),
      ('ring-winnie-size-5', 6, v_id, 'I'),
      ('ring-winnie-size-6', 7, v_id, 'J'),
      ('ring-winnie-size-7', 8, v_id, 'K'),
      ('ring-winnie-size-8', 9, v_id, 'L'),
      ('ring-winnie-size-9', 10, v_id, 'M'),
      ('ring-winnie-size-10', 11, v_id, 'N'),
      ('ring-winnie-size-11', 12, v_id, 'O'),
      ('ring-winnie-size-12', 13, v_id, 'P'),
      ('ring-winnie-size-13', 14, v_id, 'Q'),
      ('ring-winnie-size-14', 15, v_id, 'R'),
      ('ring-winnie-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-winnie-specs',
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
    'ring-yasmine',
    'Yasmine',
    'Yasmine - Elongated Cushion 4 Claw Solitaire with Hidden Halo and Cathedral Setting Engagement Ring',
    'Yasmine is a timeless elongated cushion solitaire, featuring a sparkling hidden halo within an elegant four-claw setting. Its sweeping cathedral band adds a touch of sophistication, creating a versatile design that effortlessly blends classic elegance with modern style. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'elongated_cushion'::enum_ring_shape,
    'halo'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-yasmine';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-yasmine-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/yasmine/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/yasmine/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-yasmine-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/yasmine/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/yasmine/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-yasmine-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/yasmine/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/yasmine/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-yasmine-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-yasmine-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-yasmine-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-yasmine-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-yasmine-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-yasmine-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-yasmine-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-yasmine-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-yasmine-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-yasmine-size-0', 1, v_id, 'D'),
      ('ring-yasmine-size-1', 2, v_id, 'E'),
      ('ring-yasmine-size-2', 3, v_id, 'F'),
      ('ring-yasmine-size-3', 4, v_id, 'G'),
      ('ring-yasmine-size-4', 5, v_id, 'H'),
      ('ring-yasmine-size-5', 6, v_id, 'I'),
      ('ring-yasmine-size-6', 7, v_id, 'J'),
      ('ring-yasmine-size-7', 8, v_id, 'K'),
      ('ring-yasmine-size-8', 9, v_id, 'L'),
      ('ring-yasmine-size-9', 10, v_id, 'M'),
      ('ring-yasmine-size-10', 11, v_id, 'N'),
      ('ring-yasmine-size-11', 12, v_id, 'O'),
      ('ring-yasmine-size-12', 13, v_id, 'P'),
      ('ring-yasmine-size-13', 14, v_id, 'Q'),
      ('ring-yasmine-size-14', 15, v_id, 'R'),
      ('ring-yasmine-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-yasmine-specs',
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
    'ring-zara',
    'Zara',
    'Zara - Radiant East West Claw Solitaire with Raised Basket Gallery Engagement Ring',
    'Fiona is an east–west set radiant cut centre stone positioned low within a scooped basket. The setting allows the profile to sit flush against a classic band, creating a clean, understated design with smooth, continuous lines. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'radiant'::enum_ring_shape,
    'east_west'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-zara';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-zara-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/zara/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/zara/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-zara-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/zara/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/zara/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-zara-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/zara/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/zara/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-zara-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-zara-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-zara-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-zara-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-zara-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-zara-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-zara-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-zara-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-zara-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-zara-size-0', 1, v_id, 'D'),
      ('ring-zara-size-1', 2, v_id, 'E'),
      ('ring-zara-size-2', 3, v_id, 'F'),
      ('ring-zara-size-3', 4, v_id, 'G'),
      ('ring-zara-size-4', 5, v_id, 'H'),
      ('ring-zara-size-5', 6, v_id, 'I'),
      ('ring-zara-size-6', 7, v_id, 'J'),
      ('ring-zara-size-7', 8, v_id, 'K'),
      ('ring-zara-size-8', 9, v_id, 'L'),
      ('ring-zara-size-9', 10, v_id, 'M'),
      ('ring-zara-size-10', 11, v_id, 'N'),
      ('ring-zara-size-11', 12, v_id, 'O'),
      ('ring-zara-size-12', 13, v_id, 'P'),
      ('ring-zara-size-13', 14, v_id, 'Q'),
      ('ring-zara-size-14', 15, v_id, 'R'),
      ('ring-zara-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-zara-specs',
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
    'ring-zariyah',
    'Zariyah',
    'Zariyah - Marquise 6 Claw Solitaire with Hidden Halo Engagement Ring',
    'The beauty of the classic 6-claw marquise solitaire is elevated in the Zariyah ring with the added sparkle of a hidden halo. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'marquise'::enum_ring_shape,
    'halo'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-zariyah';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-zariyah-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/zariyah/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/zariyah/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-zariyah-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/zariyah/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/zariyah/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-zariyah-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/zariyah/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/zariyah/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-zariyah-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-zariyah-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-zariyah-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-zariyah-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-zariyah-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-zariyah-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-zariyah-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-zariyah-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-zariyah-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-zariyah-size-0', 1, v_id, 'D'),
      ('ring-zariyah-size-1', 2, v_id, 'E'),
      ('ring-zariyah-size-2', 3, v_id, 'F'),
      ('ring-zariyah-size-3', 4, v_id, 'G'),
      ('ring-zariyah-size-4', 5, v_id, 'H'),
      ('ring-zariyah-size-5', 6, v_id, 'I'),
      ('ring-zariyah-size-6', 7, v_id, 'J'),
      ('ring-zariyah-size-7', 8, v_id, 'K'),
      ('ring-zariyah-size-8', 9, v_id, 'L'),
      ('ring-zariyah-size-9', 10, v_id, 'M'),
      ('ring-zariyah-size-10', 11, v_id, 'N'),
      ('ring-zariyah-size-11', 12, v_id, 'O'),
      ('ring-zariyah-size-12', 13, v_id, 'P'),
      ('ring-zariyah-size-13', 14, v_id, 'Q'),
      ('ring-zariyah-size-14', 15, v_id, 'R'),
      ('ring-zariyah-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-zariyah-specs',
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
    'ring-zelda',
    'Zelda',
    'Zelda - Oval Bezel Trilogy Engagement Ring',
    'The Zelda engagement ring is a beautiful trilogy of three bezel-set oval cut stones, creating a wonderfully symbiotic look. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'oval'::enum_ring_shape,
    'trilogy'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-zelda';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-zelda-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/zelda/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/zelda/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-zelda-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/zelda/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/zelda/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-zelda-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/zelda/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/zelda/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-zelda-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-zelda-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-zelda-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-zelda-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-zelda-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-zelda-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-zelda-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-zelda-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-zelda-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-zelda-size-0', 1, v_id, 'D'),
      ('ring-zelda-size-1', 2, v_id, 'E'),
      ('ring-zelda-size-2', 3, v_id, 'F'),
      ('ring-zelda-size-3', 4, v_id, 'G'),
      ('ring-zelda-size-4', 5, v_id, 'H'),
      ('ring-zelda-size-5', 6, v_id, 'I'),
      ('ring-zelda-size-6', 7, v_id, 'J'),
      ('ring-zelda-size-7', 8, v_id, 'K'),
      ('ring-zelda-size-8', 9, v_id, 'L'),
      ('ring-zelda-size-9', 10, v_id, 'M'),
      ('ring-zelda-size-10', 11, v_id, 'N'),
      ('ring-zelda-size-11', 12, v_id, 'O'),
      ('ring-zelda-size-12', 13, v_id, 'P'),
      ('ring-zelda-size-13', 14, v_id, 'Q'),
      ('ring-zelda-size-14', 15, v_id, 'R'),
      ('ring-zelda-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-zelda-specs',
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
    'ring-zoe',
    'Zoe',
    'Zoe - Radiant Bezel Solitaire with Open Cathedral Setting Engagement Ring',
    'The Zoe engagement ring is a modern design showcasing a beautiful radiant cut centre stone framed within a bezel cathedral setting. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'radiant'::enum_ring_shape,
    'bezel'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-zoe';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-zoe-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/zoe/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/zoe/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-zoe-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/zoe/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/zoe/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-zoe-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/zoe/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/zoe/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-zoe-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-zoe-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-zoe-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-zoe-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-zoe-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-zoe-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-zoe-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-zoe-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-zoe-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-zoe-size-0', 1, v_id, 'D'),
      ('ring-zoe-size-1', 2, v_id, 'E'),
      ('ring-zoe-size-2', 3, v_id, 'F'),
      ('ring-zoe-size-3', 4, v_id, 'G'),
      ('ring-zoe-size-4', 5, v_id, 'H'),
      ('ring-zoe-size-5', 6, v_id, 'I'),
      ('ring-zoe-size-6', 7, v_id, 'J'),
      ('ring-zoe-size-7', 8, v_id, 'K'),
      ('ring-zoe-size-8', 9, v_id, 'L'),
      ('ring-zoe-size-9', 10, v_id, 'M'),
      ('ring-zoe-size-10', 11, v_id, 'N'),
      ('ring-zoe-size-11', 12, v_id, 'O'),
      ('ring-zoe-size-12', 13, v_id, 'P'),
      ('ring-zoe-size-13', 14, v_id, 'Q'),
      ('ring-zoe-size-14', 15, v_id, 'R'),
      ('ring-zoe-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-zoe-specs',
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
    'ring-zya',
    'Zya',
    'Zya - Round Claw Solitaire with Trellis Gallery, Lattice Detail and Cathedral Low Setting Engagement Ring',
    'The Zya engagement ring features a beautiful round cut centre stone held in a graceful 6-claw woven trellis setting. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'round'::enum_ring_shape,
    'solitaire'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'low_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-zya';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-zya-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/zya/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/zya/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-zya-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/zya/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/zya/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-zya-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/zya/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/zya/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-zya-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-zya-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-zya-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-zya-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-zya-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-zya-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-zya-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-zya-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-zya-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-zya-size-0', 1, v_id, 'D'),
      ('ring-zya-size-1', 2, v_id, 'E'),
      ('ring-zya-size-2', 3, v_id, 'F'),
      ('ring-zya-size-3', 4, v_id, 'G'),
      ('ring-zya-size-4', 5, v_id, 'H'),
      ('ring-zya-size-5', 6, v_id, 'I'),
      ('ring-zya-size-6', 7, v_id, 'J'),
      ('ring-zya-size-7', 8, v_id, 'K'),
      ('ring-zya-size-8', 9, v_id, 'L'),
      ('ring-zya-size-9', 10, v_id, 'M'),
      ('ring-zya-size-10', 11, v_id, 'N'),
      ('ring-zya-size-11', 12, v_id, 'O'),
      ('ring-zya-size-12', 13, v_id, 'P'),
      ('ring-zya-size-13', 14, v_id, 'Q'),
      ('ring-zya-size-14', 15, v_id, 'R'),
      ('ring-zya-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-zya-specs',
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

