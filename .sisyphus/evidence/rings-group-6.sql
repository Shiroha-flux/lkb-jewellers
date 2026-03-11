DO $$
DECLARE v_id UUID;
BEGIN
  INSERT INTO engagement_rings (slug, name, title, description, base_price_usd, currency, shape, setting_style, band_type, setting_profile)
  VALUES (
    'ring-kate',
    'Kate',
    'Kate - Emerald 4 Claw Solitaire with Cigar Band and Hidden Halo Engagement Ring',
    'Kate showcases a sophisticated 4-claw emerald solitaire, sparkling hidden halo and thick cigar band. Kate is available in both high and low setting heights. Schedule an appointment with Cullen US today.',
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
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-kate';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-kate-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/kate/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/kate/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-kate-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/kate/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/kate/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-kate-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/kate/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/kate/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-kate-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-kate-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-kate-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-kate-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-kate-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-kate-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-kate-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-kate-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-kate-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-kate-size-0', 1, v_id, 'D'),
      ('ring-kate-size-1', 2, v_id, 'E'),
      ('ring-kate-size-2', 3, v_id, 'F'),
      ('ring-kate-size-3', 4, v_id, 'G'),
      ('ring-kate-size-4', 5, v_id, 'H'),
      ('ring-kate-size-5', 6, v_id, 'I'),
      ('ring-kate-size-6', 7, v_id, 'J'),
      ('ring-kate-size-7', 8, v_id, 'K'),
      ('ring-kate-size-8', 9, v_id, 'L'),
      ('ring-kate-size-9', 10, v_id, 'M'),
      ('ring-kate-size-10', 11, v_id, 'N'),
      ('ring-kate-size-11', 12, v_id, 'O'),
      ('ring-kate-size-12', 13, v_id, 'P'),
      ('ring-kate-size-13', 14, v_id, 'Q'),
      ('ring-kate-size-14', 15, v_id, 'R'),
      ('ring-kate-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-kate-specs',
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
    'ring-kelsey',
    'Kelsey',
    'Kelsey - Elongated Cushion 4 Claw Solitaire with Cathedral Setting and Open Trellis Gallery Engagement Ring',
    'The timeless 4-claw elongated cushion solitaire design is elevated in the Kelsey engagement ring with a romantic woven trellis setting. Schedule an appointment with Cullen US today.',
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
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-kelsey';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-kelsey-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/kelsey/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/kelsey/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-kelsey-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/kelsey/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/kelsey/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-kelsey-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/kelsey/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/kelsey/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-kelsey-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-kelsey-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-kelsey-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-kelsey-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-kelsey-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-kelsey-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-kelsey-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-kelsey-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-kelsey-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-kelsey-size-0', 1, v_id, 'D'),
      ('ring-kelsey-size-1', 2, v_id, 'E'),
      ('ring-kelsey-size-2', 3, v_id, 'F'),
      ('ring-kelsey-size-3', 4, v_id, 'G'),
      ('ring-kelsey-size-4', 5, v_id, 'H'),
      ('ring-kelsey-size-5', 6, v_id, 'I'),
      ('ring-kelsey-size-6', 7, v_id, 'J'),
      ('ring-kelsey-size-7', 8, v_id, 'K'),
      ('ring-kelsey-size-8', 9, v_id, 'L'),
      ('ring-kelsey-size-9', 10, v_id, 'M'),
      ('ring-kelsey-size-10', 11, v_id, 'N'),
      ('ring-kelsey-size-11', 12, v_id, 'O'),
      ('ring-kelsey-size-12', 13, v_id, 'P'),
      ('ring-kelsey-size-13', 14, v_id, 'Q'),
      ('ring-kelsey-size-14', 15, v_id, 'R'),
      ('ring-kelsey-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-kelsey-specs',
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
    'ring-kiana',
    'Kiana',
    'Kiana - Oval 4 Claw Solitaire with Hidden Halo and Floating Cathedral Low Setting Engagement Ring',
    'Kiana is a modern solitaire that doesn''t ask you to choose between beauty and practicality. Featuring a low-set oval centre stone, its open bridge and hidden halo create a graceful floating effect, allowing the design to sit low on the finger while pairing seamlessly flush with a matching wedding band. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'oval'::enum_ring_shape,
    'halo'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'low_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-kiana';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-kiana-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/kiana/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/kiana/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-kiana-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/kiana/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/kiana/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-kiana-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/kiana/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/kiana/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-kiana-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-kiana-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-kiana-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-kiana-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-kiana-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-kiana-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-kiana-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-kiana-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-kiana-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-kiana-size-0', 1, v_id, 'D'),
      ('ring-kiana-size-1', 2, v_id, 'E'),
      ('ring-kiana-size-2', 3, v_id, 'F'),
      ('ring-kiana-size-3', 4, v_id, 'G'),
      ('ring-kiana-size-4', 5, v_id, 'H'),
      ('ring-kiana-size-5', 6, v_id, 'I'),
      ('ring-kiana-size-6', 7, v_id, 'J'),
      ('ring-kiana-size-7', 8, v_id, 'K'),
      ('ring-kiana-size-8', 9, v_id, 'L'),
      ('ring-kiana-size-9', 10, v_id, 'M'),
      ('ring-kiana-size-10', 11, v_id, 'N'),
      ('ring-kiana-size-11', 12, v_id, 'O'),
      ('ring-kiana-size-12', 13, v_id, 'P'),
      ('ring-kiana-size-13', 14, v_id, 'Q'),
      ('ring-kiana-size-14', 15, v_id, 'R'),
      ('ring-kiana-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-kiana-specs',
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
    'ring-kimia',
    'Kimia',
    'Kimia - Round 4 Claw Solitaire with Bypass Band Engagement Ring',
    'Kimia centres a round stone in a refined four-claw setting, supported by a gently twisting bypass band. Soft curves wrap around the basket, creating a light, contemporary silhouette with sculptural balance. Schedule an appointment with Cullen US today.',
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
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-kimia';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-kimia-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/kimia/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/kimia/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-kimia-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/kimia/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/kimia/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-kimia-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/kimia/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/kimia/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-kimia-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-kimia-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-kimia-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-kimia-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-kimia-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-kimia-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-kimia-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-kimia-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-kimia-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-kimia-size-0', 1, v_id, 'D'),
      ('ring-kimia-size-1', 2, v_id, 'E'),
      ('ring-kimia-size-2', 3, v_id, 'F'),
      ('ring-kimia-size-3', 4, v_id, 'G'),
      ('ring-kimia-size-4', 5, v_id, 'H'),
      ('ring-kimia-size-5', 6, v_id, 'I'),
      ('ring-kimia-size-6', 7, v_id, 'J'),
      ('ring-kimia-size-7', 8, v_id, 'K'),
      ('ring-kimia-size-8', 9, v_id, 'L'),
      ('ring-kimia-size-9', 10, v_id, 'M'),
      ('ring-kimia-size-10', 11, v_id, 'N'),
      ('ring-kimia-size-11', 12, v_id, 'O'),
      ('ring-kimia-size-12', 13, v_id, 'P'),
      ('ring-kimia-size-13', 14, v_id, 'Q'),
      ('ring-kimia-size-14', 15, v_id, 'R'),
      ('ring-kimia-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-kimia-specs',
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
    'ring-kirsten',
    'Kirsten',
    'Kirsten - Pear 6 Claw Solitaire with Pave Band and Halo and Low Setting Engagement Ring',
    'The Kirsten engagement ring is a glamourous 6-claw pear halo design with low-set basket setting and sparkling half pavé band. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'pear'::enum_ring_shape,
    'halo'::enum_ring_setting_style,
    'pave'::enum_ring_band_type,
    'low_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-kirsten';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-kirsten-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/kirsten/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/kirsten/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-kirsten-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/kirsten/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/kirsten/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-kirsten-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/kirsten/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/kirsten/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-kirsten-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-kirsten-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-kirsten-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-kirsten-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-kirsten-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-kirsten-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-kirsten-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-kirsten-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-kirsten-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-kirsten-size-0', 1, v_id, 'D'),
      ('ring-kirsten-size-1', 2, v_id, 'E'),
      ('ring-kirsten-size-2', 3, v_id, 'F'),
      ('ring-kirsten-size-3', 4, v_id, 'G'),
      ('ring-kirsten-size-4', 5, v_id, 'H'),
      ('ring-kirsten-size-5', 6, v_id, 'I'),
      ('ring-kirsten-size-6', 7, v_id, 'J'),
      ('ring-kirsten-size-7', 8, v_id, 'K'),
      ('ring-kirsten-size-8', 9, v_id, 'L'),
      ('ring-kirsten-size-9', 10, v_id, 'M'),
      ('ring-kirsten-size-10', 11, v_id, 'N'),
      ('ring-kirsten-size-11', 12, v_id, 'O'),
      ('ring-kirsten-size-12', 13, v_id, 'P'),
      ('ring-kirsten-size-13', 14, v_id, 'Q'),
      ('ring-kirsten-size-14', 15, v_id, 'R'),
      ('ring-kirsten-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-kirsten-specs',
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
    'ring-kyla',
    'Kyla',
    'Kyla - Radiant Claw Solitaire with Marquise-Round Accent Stones and Wrap Around Hidden Halo Engagement Ring',
    'Kyla is a showstopping 4-claw radiant solitaire design with the extra sparkle of a wrap-around hidden halo and distinct pattern of round and marquise cut accent stones placed along the band. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'round'::enum_ring_shape,
    'halo'::enum_ring_setting_style,
    'accents'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-kyla';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-kyla-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/kyla/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/kyla/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-kyla-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/kyla/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/kyla/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-kyla-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/kyla/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/kyla/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-kyla-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-kyla-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-kyla-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-kyla-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-kyla-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-kyla-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-kyla-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-kyla-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-kyla-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-kyla-size-0', 1, v_id, 'D'),
      ('ring-kyla-size-1', 2, v_id, 'E'),
      ('ring-kyla-size-2', 3, v_id, 'F'),
      ('ring-kyla-size-3', 4, v_id, 'G'),
      ('ring-kyla-size-4', 5, v_id, 'H'),
      ('ring-kyla-size-5', 6, v_id, 'I'),
      ('ring-kyla-size-6', 7, v_id, 'J'),
      ('ring-kyla-size-7', 8, v_id, 'K'),
      ('ring-kyla-size-8', 9, v_id, 'L'),
      ('ring-kyla-size-9', 10, v_id, 'M'),
      ('ring-kyla-size-10', 11, v_id, 'N'),
      ('ring-kyla-size-11', 12, v_id, 'O'),
      ('ring-kyla-size-12', 13, v_id, 'P'),
      ('ring-kyla-size-13', 14, v_id, 'Q'),
      ('ring-kyla-size-14', 15, v_id, 'R'),
      ('ring-kyla-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-kyla-specs',
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
    'ring-lara',
    'Lara',
    'Lara - Oval 4 Claw Solitaire with Hidden Halo and Twisted Alternating Pave Band Engagement Ring',
    'Lara is an elegant braided engagement ring displaying an interweaving half-circle of sleek pavé and polished metal, 4-claw oval cut centre stone and sparkling hidden halo. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'oval'::enum_ring_shape,
    'halo'::enum_ring_setting_style,
    'pave'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-lara';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-lara-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/lara/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/lara/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-lara-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/lara/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/lara/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-lara-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/lara/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/lara/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-lara-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-lara-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-lara-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-lara-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-lara-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-lara-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-lara-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-lara-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-lara-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-lara-size-0', 1, v_id, 'D'),
      ('ring-lara-size-1', 2, v_id, 'E'),
      ('ring-lara-size-2', 3, v_id, 'F'),
      ('ring-lara-size-3', 4, v_id, 'G'),
      ('ring-lara-size-4', 5, v_id, 'H'),
      ('ring-lara-size-5', 6, v_id, 'I'),
      ('ring-lara-size-6', 7, v_id, 'J'),
      ('ring-lara-size-7', 8, v_id, 'K'),
      ('ring-lara-size-8', 9, v_id, 'L'),
      ('ring-lara-size-9', 10, v_id, 'M'),
      ('ring-lara-size-10', 11, v_id, 'N'),
      ('ring-lara-size-11', 12, v_id, 'O'),
      ('ring-lara-size-12', 13, v_id, 'P'),
      ('ring-lara-size-13', 14, v_id, 'Q'),
      ('ring-lara-size-14', 15, v_id, 'R'),
      ('ring-lara-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-lara-specs',
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
    'ring-leila',
    'Leila',
    'Leila - Marquise 6 Claw Solitaire with Cathedral Setting Engagement Ring',
    'Leila is a classic 6-claw marquise solitaire design with beautiful cathedral arches and a polished band. Schedule an appointment with Cullen US today.',
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
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-leila';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-leila-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/leila/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/leila/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-leila-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/leila/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/leila/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-leila-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/leila/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/leila/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-leila-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-leila-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-leila-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-leila-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-leila-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-leila-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-leila-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-leila-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-leila-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-leila-size-0', 1, v_id, 'D'),
      ('ring-leila-size-1', 2, v_id, 'E'),
      ('ring-leila-size-2', 3, v_id, 'F'),
      ('ring-leila-size-3', 4, v_id, 'G'),
      ('ring-leila-size-4', 5, v_id, 'H'),
      ('ring-leila-size-5', 6, v_id, 'I'),
      ('ring-leila-size-6', 7, v_id, 'J'),
      ('ring-leila-size-7', 8, v_id, 'K'),
      ('ring-leila-size-8', 9, v_id, 'L'),
      ('ring-leila-size-9', 10, v_id, 'M'),
      ('ring-leila-size-10', 11, v_id, 'N'),
      ('ring-leila-size-11', 12, v_id, 'O'),
      ('ring-leila-size-12', 13, v_id, 'P'),
      ('ring-leila-size-13', 14, v_id, 'Q'),
      ('ring-leila-size-14', 15, v_id, 'R'),
      ('ring-leila-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-leila-specs',
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
    'ring-leslie',
    'Leslie',
    'Leslie - Round Claw Solitaire with Hidden Halo, Opposing Marquise Accents and Cathedral High Setting Engagement Ring',
    'The Leslie engagement ring showcases a 4-claw round centre stone, illuminated by a hidden halo beneath. A refined cathedral setting gives height and presence, while opposing marquise-cut side stones taper delicately along the band. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'round'::enum_ring_shape,
    'halo'::enum_ring_setting_style,
    'accents'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-leslie';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-leslie-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/leslie/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/leslie/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-leslie-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/leslie/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/leslie/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-leslie-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/leslie/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/leslie/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-leslie-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-leslie-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-leslie-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-leslie-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-leslie-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-leslie-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-leslie-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-leslie-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-leslie-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-leslie-size-0', 1, v_id, 'D'),
      ('ring-leslie-size-1', 2, v_id, 'E'),
      ('ring-leslie-size-2', 3, v_id, 'F'),
      ('ring-leslie-size-3', 4, v_id, 'G'),
      ('ring-leslie-size-4', 5, v_id, 'H'),
      ('ring-leslie-size-5', 6, v_id, 'I'),
      ('ring-leslie-size-6', 7, v_id, 'J'),
      ('ring-leslie-size-7', 8, v_id, 'K'),
      ('ring-leslie-size-8', 9, v_id, 'L'),
      ('ring-leslie-size-9', 10, v_id, 'M'),
      ('ring-leslie-size-10', 11, v_id, 'N'),
      ('ring-leslie-size-11', 12, v_id, 'O'),
      ('ring-leslie-size-12', 13, v_id, 'P'),
      ('ring-leslie-size-13', 14, v_id, 'Q'),
      ('ring-leslie-size-14', 15, v_id, 'R'),
      ('ring-leslie-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-leslie-specs',
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
    'ring-lexie',
    'Lexie',
    'Lexie - Statement Oval Bezel Solitaire with Open Cathedral Setting Engagement Ring',
    'Lexie is a striking bezel-set oval solitaire, graced with elegant cathedral arches to accentuate the brilliance of this raised centre stone. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'oval'::enum_ring_shape,
    'bezel'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-lexie';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-lexie-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/lexie/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/lexie/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-lexie-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/lexie/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/lexie/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-lexie-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/lexie/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/lexie/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-lexie-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-lexie-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-lexie-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-lexie-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-lexie-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-lexie-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-lexie-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-lexie-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-lexie-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-lexie-size-0', 1, v_id, 'D'),
      ('ring-lexie-size-1', 2, v_id, 'E'),
      ('ring-lexie-size-2', 3, v_id, 'F'),
      ('ring-lexie-size-3', 4, v_id, 'G'),
      ('ring-lexie-size-4', 5, v_id, 'H'),
      ('ring-lexie-size-5', 6, v_id, 'I'),
      ('ring-lexie-size-6', 7, v_id, 'J'),
      ('ring-lexie-size-7', 8, v_id, 'K'),
      ('ring-lexie-size-8', 9, v_id, 'L'),
      ('ring-lexie-size-9', 10, v_id, 'M'),
      ('ring-lexie-size-10', 11, v_id, 'N'),
      ('ring-lexie-size-11', 12, v_id, 'O'),
      ('ring-lexie-size-12', 13, v_id, 'P'),
      ('ring-lexie-size-13', 14, v_id, 'Q'),
      ('ring-lexie-size-14', 15, v_id, 'R'),
      ('ring-lexie-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-lexie-specs',
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
    'ring-liberty',
    'Liberty',
    'Liberty - Radiant 4 Claw Solitaire with Wrap Around Hidden Halo Engagement Ring',
    'Liberty is a stunning solitaire design featuring a radiant cut centre stone, four eagle-tipped claws and a wrap-around hidden halo. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'round'::enum_ring_shape,
    'halo'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-liberty';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-liberty-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/liberty/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/liberty/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-liberty-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/liberty/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/liberty/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-liberty-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/liberty/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/liberty/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-liberty-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-liberty-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-liberty-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-liberty-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-liberty-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-liberty-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-liberty-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-liberty-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-liberty-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-liberty-size-0', 1, v_id, 'D'),
      ('ring-liberty-size-1', 2, v_id, 'E'),
      ('ring-liberty-size-2', 3, v_id, 'F'),
      ('ring-liberty-size-3', 4, v_id, 'G'),
      ('ring-liberty-size-4', 5, v_id, 'H'),
      ('ring-liberty-size-5', 6, v_id, 'I'),
      ('ring-liberty-size-6', 7, v_id, 'J'),
      ('ring-liberty-size-7', 8, v_id, 'K'),
      ('ring-liberty-size-8', 9, v_id, 'L'),
      ('ring-liberty-size-9', 10, v_id, 'M'),
      ('ring-liberty-size-10', 11, v_id, 'N'),
      ('ring-liberty-size-11', 12, v_id, 'O'),
      ('ring-liberty-size-12', 13, v_id, 'P'),
      ('ring-liberty-size-13', 14, v_id, 'Q'),
      ('ring-liberty-size-14', 15, v_id, 'R'),
      ('ring-liberty-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-liberty-specs',
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
    'ring-lilly',
    'Lilly',
    'Lilly - Round 4 Claw Solitaire Engagement Ring',
    'Lilly is a timeless classic solitaire design featuring a beautiful round cut centre stone held in a delicate high-set 4-claw setting. Schedule an appointment with Cullen US today.',
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
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-lilly';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-lilly-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/lilly/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/lilly/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-lilly-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/lilly/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/lilly/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-lilly-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/lilly/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/lilly/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-lilly-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-lilly-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-lilly-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-lilly-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-lilly-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-lilly-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-lilly-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-lilly-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-lilly-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-lilly-size-0', 1, v_id, 'D'),
      ('ring-lilly-size-1', 2, v_id, 'E'),
      ('ring-lilly-size-2', 3, v_id, 'F'),
      ('ring-lilly-size-3', 4, v_id, 'G'),
      ('ring-lilly-size-4', 5, v_id, 'H'),
      ('ring-lilly-size-5', 6, v_id, 'I'),
      ('ring-lilly-size-6', 7, v_id, 'J'),
      ('ring-lilly-size-7', 8, v_id, 'K'),
      ('ring-lilly-size-8', 9, v_id, 'L'),
      ('ring-lilly-size-9', 10, v_id, 'M'),
      ('ring-lilly-size-10', 11, v_id, 'N'),
      ('ring-lilly-size-11', 12, v_id, 'O'),
      ('ring-lilly-size-12', 13, v_id, 'P'),
      ('ring-lilly-size-13', 14, v_id, 'Q'),
      ('ring-lilly-size-14', 15, v_id, 'R'),
      ('ring-lilly-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-lilly-specs',
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
    'ring-lorelai',
    'Lorelai',
    'Lorelai - Round Claw Solitaire with Hidden Halo and Twisted Alternating Pave Band Engagement Ring',
    'Lorelai is an elegant twisted engagement ring displaying an interweaving half-circle of sleek pavé and polished metal, 4-claw round cut centre stone and sparkling hidden halo. Schedule an appointment with Cullen US today.',
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
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-lorelai';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-lorelai-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/lorelai/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/lorelai/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-lorelai-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/lorelai/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/lorelai/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-lorelai-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/lorelai/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/lorelai/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-lorelai-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-lorelai-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-lorelai-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-lorelai-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-lorelai-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-lorelai-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-lorelai-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-lorelai-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-lorelai-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-lorelai-size-0', 1, v_id, 'D'),
      ('ring-lorelai-size-1', 2, v_id, 'E'),
      ('ring-lorelai-size-2', 3, v_id, 'F'),
      ('ring-lorelai-size-3', 4, v_id, 'G'),
      ('ring-lorelai-size-4', 5, v_id, 'H'),
      ('ring-lorelai-size-5', 6, v_id, 'I'),
      ('ring-lorelai-size-6', 7, v_id, 'J'),
      ('ring-lorelai-size-7', 8, v_id, 'K'),
      ('ring-lorelai-size-8', 9, v_id, 'L'),
      ('ring-lorelai-size-9', 10, v_id, 'M'),
      ('ring-lorelai-size-10', 11, v_id, 'N'),
      ('ring-lorelai-size-11', 12, v_id, 'O'),
      ('ring-lorelai-size-12', 13, v_id, 'P'),
      ('ring-lorelai-size-13', 14, v_id, 'Q'),
      ('ring-lorelai-size-14', 15, v_id, 'R'),
      ('ring-lorelai-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-lorelai-specs',
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
    'ring-lorena',
    'Lorena',
    'Lorena - Round Claw Solitaire with Bypass Band and Clustered Round-Marquise Accent Stones Engagement Ring',
    'Lorena pairs a round centre stone with a contemporary bypass setting. Curved lines are finished with round and marquise accent stones creating an open, sculptural silhouette. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'round'::enum_ring_shape,
    'solitaire'::enum_ring_setting_style,
    'accents'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-lorena';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-lorena-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/lorena/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/lorena/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-lorena-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/lorena/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/lorena/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-lorena-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/lorena/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/lorena/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-lorena-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-lorena-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-lorena-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-lorena-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-lorena-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-lorena-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-lorena-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-lorena-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-lorena-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-lorena-size-0', 1, v_id, 'D'),
      ('ring-lorena-size-1', 2, v_id, 'E'),
      ('ring-lorena-size-2', 3, v_id, 'F'),
      ('ring-lorena-size-3', 4, v_id, 'G'),
      ('ring-lorena-size-4', 5, v_id, 'H'),
      ('ring-lorena-size-5', 6, v_id, 'I'),
      ('ring-lorena-size-6', 7, v_id, 'J'),
      ('ring-lorena-size-7', 8, v_id, 'K'),
      ('ring-lorena-size-8', 9, v_id, 'L'),
      ('ring-lorena-size-9', 10, v_id, 'M'),
      ('ring-lorena-size-10', 11, v_id, 'N'),
      ('ring-lorena-size-11', 12, v_id, 'O'),
      ('ring-lorena-size-12', 13, v_id, 'P'),
      ('ring-lorena-size-13', 14, v_id, 'Q'),
      ('ring-lorena-size-14', 15, v_id, 'R'),
      ('ring-lorena-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-lorena-specs',
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
    'ring-louise',
    'Louise',
    'Louise - Round 6 Claw Solitaire Engagement Ring',
    'Louise is a classic solitaire engagement ring showcasing a stunning round cut centre stone held by six elegant eagle-tipped claws. Schedule an appointment with Cullen US today.',
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
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-louise';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-louise-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/louise/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/louise/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-louise-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/louise/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/louise/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-louise-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/louise/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/louise/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-louise-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-louise-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-louise-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-louise-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-louise-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-louise-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-louise-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-louise-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-louise-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-louise-size-0', 1, v_id, 'D'),
      ('ring-louise-size-1', 2, v_id, 'E'),
      ('ring-louise-size-2', 3, v_id, 'F'),
      ('ring-louise-size-3', 4, v_id, 'G'),
      ('ring-louise-size-4', 5, v_id, 'H'),
      ('ring-louise-size-5', 6, v_id, 'I'),
      ('ring-louise-size-6', 7, v_id, 'J'),
      ('ring-louise-size-7', 8, v_id, 'K'),
      ('ring-louise-size-8', 9, v_id, 'L'),
      ('ring-louise-size-9', 10, v_id, 'M'),
      ('ring-louise-size-10', 11, v_id, 'N'),
      ('ring-louise-size-11', 12, v_id, 'O'),
      ('ring-louise-size-12', 13, v_id, 'P'),
      ('ring-louise-size-13', 14, v_id, 'Q'),
      ('ring-louise-size-14', 15, v_id, 'R'),
      ('ring-louise-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-louise-specs',
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
    'ring-luna',
    'Luna',
    'Luna - Round 4 Claw Solitaire with Hidden Halo and Floating Cathedral Low Setting Engagement Ring',
    'Luna is a modern solitaire that doesn''t ask you to choose between beauty and practicality. Featuring a low-set round centre stone, its open bridge and hidden halo create a graceful floating effect, allowing the design to sit low on the finger while pairing seamlessly flush with a matching wedding band. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'round'::enum_ring_shape,
    'halo'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'low_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-luna';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-luna-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/luna/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/luna/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-luna-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/luna/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/luna/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-luna-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/luna/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/luna/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-luna-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-luna-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-luna-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-luna-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-luna-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-luna-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-luna-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-luna-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-luna-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-luna-size-0', 1, v_id, 'D'),
      ('ring-luna-size-1', 2, v_id, 'E'),
      ('ring-luna-size-2', 3, v_id, 'F'),
      ('ring-luna-size-3', 4, v_id, 'G'),
      ('ring-luna-size-4', 5, v_id, 'H'),
      ('ring-luna-size-5', 6, v_id, 'I'),
      ('ring-luna-size-6', 7, v_id, 'J'),
      ('ring-luna-size-7', 8, v_id, 'K'),
      ('ring-luna-size-8', 9, v_id, 'L'),
      ('ring-luna-size-9', 10, v_id, 'M'),
      ('ring-luna-size-10', 11, v_id, 'N'),
      ('ring-luna-size-11', 12, v_id, 'O'),
      ('ring-luna-size-12', 13, v_id, 'P'),
      ('ring-luna-size-13', 14, v_id, 'Q'),
      ('ring-luna-size-14', 15, v_id, 'R'),
      ('ring-luna-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-luna-specs',
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
    'ring-mabeline',
    'Mabeline',
    'Mabeline - Oval 4 Claw Solitaire with East West Setting and Raised Basket Gallery Engagement Ring',
    'Mabeline is a sleek east-west design featuring a stunning oval cut centre stone placed horizontally in a low-set 4-claw basket setting. Schedule an appointment with Cullen US today.',
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
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-mabeline';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-mabeline-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/mabeline/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/mabeline/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-mabeline-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/mabeline/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/mabeline/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-mabeline-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/mabeline/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/mabeline/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-mabeline-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-mabeline-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-mabeline-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-mabeline-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-mabeline-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-mabeline-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-mabeline-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-mabeline-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-mabeline-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-mabeline-size-0', 1, v_id, 'D'),
      ('ring-mabeline-size-1', 2, v_id, 'E'),
      ('ring-mabeline-size-2', 3, v_id, 'F'),
      ('ring-mabeline-size-3', 4, v_id, 'G'),
      ('ring-mabeline-size-4', 5, v_id, 'H'),
      ('ring-mabeline-size-5', 6, v_id, 'I'),
      ('ring-mabeline-size-6', 7, v_id, 'J'),
      ('ring-mabeline-size-7', 8, v_id, 'K'),
      ('ring-mabeline-size-8', 9, v_id, 'L'),
      ('ring-mabeline-size-9', 10, v_id, 'M'),
      ('ring-mabeline-size-10', 11, v_id, 'N'),
      ('ring-mabeline-size-11', 12, v_id, 'O'),
      ('ring-mabeline-size-12', 13, v_id, 'P'),
      ('ring-mabeline-size-13', 14, v_id, 'Q'),
      ('ring-mabeline-size-14', 15, v_id, 'R'),
      ('ring-mabeline-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-mabeline-specs',
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
    'ring-madeline',
    'Madeline',
    'Madeline - Pear 5 Claw Solitaire with Halo and Pave Band and Cathedral Setting Engagement Ring',
    'The Madeline engagement ring is an elegant pear halo design featuring five eagle-tipped claws, basket setting and 2/3 pavé band. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'pear'::enum_ring_shape,
    'halo'::enum_ring_setting_style,
    'pave'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-madeline';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-madeline-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/madeline/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/madeline/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-madeline-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/madeline/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/madeline/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-madeline-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/madeline/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/madeline/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-madeline-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-madeline-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-madeline-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-madeline-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-madeline-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-madeline-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-madeline-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-madeline-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-madeline-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-madeline-size-0', 1, v_id, 'D'),
      ('ring-madeline-size-1', 2, v_id, 'E'),
      ('ring-madeline-size-2', 3, v_id, 'F'),
      ('ring-madeline-size-3', 4, v_id, 'G'),
      ('ring-madeline-size-4', 5, v_id, 'H'),
      ('ring-madeline-size-5', 6, v_id, 'I'),
      ('ring-madeline-size-6', 7, v_id, 'J'),
      ('ring-madeline-size-7', 8, v_id, 'K'),
      ('ring-madeline-size-8', 9, v_id, 'L'),
      ('ring-madeline-size-9', 10, v_id, 'M'),
      ('ring-madeline-size-10', 11, v_id, 'N'),
      ('ring-madeline-size-11', 12, v_id, 'O'),
      ('ring-madeline-size-12', 13, v_id, 'P'),
      ('ring-madeline-size-13', 14, v_id, 'Q'),
      ('ring-madeline-size-14', 15, v_id, 'R'),
      ('ring-madeline-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-madeline-specs',
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
    'ring-maeve',
    'Maeve',
    'Maeve - Round Bezel Solitaire with Twisted Gallery Engagement Ring',
    'The Maeve design is a stunning round bezel-set engagement ring with cathedral arches and a striking twisted gallery. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'round'::enum_ring_shape,
    'bezel'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-maeve';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-maeve-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/maeve/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/maeve/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-maeve-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/maeve/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/maeve/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-maeve-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/maeve/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/maeve/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-maeve-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-maeve-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-maeve-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-maeve-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-maeve-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-maeve-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-maeve-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-maeve-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-maeve-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-maeve-size-0', 1, v_id, 'D'),
      ('ring-maeve-size-1', 2, v_id, 'E'),
      ('ring-maeve-size-2', 3, v_id, 'F'),
      ('ring-maeve-size-3', 4, v_id, 'G'),
      ('ring-maeve-size-4', 5, v_id, 'H'),
      ('ring-maeve-size-5', 6, v_id, 'I'),
      ('ring-maeve-size-6', 7, v_id, 'J'),
      ('ring-maeve-size-7', 8, v_id, 'K'),
      ('ring-maeve-size-8', 9, v_id, 'L'),
      ('ring-maeve-size-9', 10, v_id, 'M'),
      ('ring-maeve-size-10', 11, v_id, 'N'),
      ('ring-maeve-size-11', 12, v_id, 'O'),
      ('ring-maeve-size-12', 13, v_id, 'P'),
      ('ring-maeve-size-13', 14, v_id, 'Q'),
      ('ring-maeve-size-14', 15, v_id, 'R'),
      ('ring-maeve-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-maeve-specs',
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
    'ring-mahlia',
    'Mahlia',
    'Mahlia - Round 6 Claw Solitaire with Sweeping Micropavé Band Engagement Ring',
    'Mahlia is an exquisite round solitaire design with a sweeping micro pavé band and six delicate round claws. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'round'::enum_ring_shape,
    'solitaire'::enum_ring_setting_style,
    'pave'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-mahlia';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-mahlia-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/mahlia/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/mahlia/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-mahlia-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/mahlia/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/mahlia/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-mahlia-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/mahlia/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/mahlia/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-mahlia-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-mahlia-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-mahlia-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-mahlia-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-mahlia-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-mahlia-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-mahlia-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-mahlia-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-mahlia-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-mahlia-size-0', 1, v_id, 'D'),
      ('ring-mahlia-size-1', 2, v_id, 'E'),
      ('ring-mahlia-size-2', 3, v_id, 'F'),
      ('ring-mahlia-size-3', 4, v_id, 'G'),
      ('ring-mahlia-size-4', 5, v_id, 'H'),
      ('ring-mahlia-size-5', 6, v_id, 'I'),
      ('ring-mahlia-size-6', 7, v_id, 'J'),
      ('ring-mahlia-size-7', 8, v_id, 'K'),
      ('ring-mahlia-size-8', 9, v_id, 'L'),
      ('ring-mahlia-size-9', 10, v_id, 'M'),
      ('ring-mahlia-size-10', 11, v_id, 'N'),
      ('ring-mahlia-size-11', 12, v_id, 'O'),
      ('ring-mahlia-size-12', 13, v_id, 'P'),
      ('ring-mahlia-size-13', 14, v_id, 'Q'),
      ('ring-mahlia-size-14', 15, v_id, 'R'),
      ('ring-mahlia-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-mahlia-specs',
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
    'ring-maisy',
    'Maisy',
    'Maisy - Round 6 Claw Solitaire with Pave Band and Cathedral Setting Engagement Ring',
    'Maisy is a sophisticated 6-claw round solitaire design featuring a sweeping cathedral setting and sparkling 2/3 pavé band. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'round'::enum_ring_shape,
    'solitaire'::enum_ring_setting_style,
    'pave'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-maisy';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-maisy-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/maisy/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/maisy/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-maisy-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/maisy/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/maisy/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-maisy-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/maisy/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/maisy/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-maisy-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-maisy-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-maisy-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-maisy-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-maisy-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-maisy-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-maisy-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-maisy-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-maisy-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-maisy-size-0', 1, v_id, 'D'),
      ('ring-maisy-size-1', 2, v_id, 'E'),
      ('ring-maisy-size-2', 3, v_id, 'F'),
      ('ring-maisy-size-3', 4, v_id, 'G'),
      ('ring-maisy-size-4', 5, v_id, 'H'),
      ('ring-maisy-size-5', 6, v_id, 'I'),
      ('ring-maisy-size-6', 7, v_id, 'J'),
      ('ring-maisy-size-7', 8, v_id, 'K'),
      ('ring-maisy-size-8', 9, v_id, 'L'),
      ('ring-maisy-size-9', 10, v_id, 'M'),
      ('ring-maisy-size-10', 11, v_id, 'N'),
      ('ring-maisy-size-11', 12, v_id, 'O'),
      ('ring-maisy-size-12', 13, v_id, 'P'),
      ('ring-maisy-size-13', 14, v_id, 'Q'),
      ('ring-maisy-size-14', 15, v_id, 'R'),
      ('ring-maisy-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-maisy-specs',
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
    'ring-mariah',
    'Mariah',
    'Mariah - Round 6 Claw Solitaire with Crown Gallery Engagement Ring',
    'Mariah is an elegant low-set solitaire design with a round cut centre stone and six eagle-tipped claws. Schedule an appointment with Cullen US today.',
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
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-mariah';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-mariah-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/mariah/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/mariah/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-mariah-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/mariah/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/mariah/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-mariah-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/mariah/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/mariah/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-mariah-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-mariah-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-mariah-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-mariah-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-mariah-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-mariah-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-mariah-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-mariah-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-mariah-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-mariah-size-0', 1, v_id, 'D'),
      ('ring-mariah-size-1', 2, v_id, 'E'),
      ('ring-mariah-size-2', 3, v_id, 'F'),
      ('ring-mariah-size-3', 4, v_id, 'G'),
      ('ring-mariah-size-4', 5, v_id, 'H'),
      ('ring-mariah-size-5', 6, v_id, 'I'),
      ('ring-mariah-size-6', 7, v_id, 'J'),
      ('ring-mariah-size-7', 8, v_id, 'K'),
      ('ring-mariah-size-8', 9, v_id, 'L'),
      ('ring-mariah-size-9', 10, v_id, 'M'),
      ('ring-mariah-size-10', 11, v_id, 'N'),
      ('ring-mariah-size-11', 12, v_id, 'O'),
      ('ring-mariah-size-12', 13, v_id, 'P'),
      ('ring-mariah-size-13', 14, v_id, 'Q'),
      ('ring-mariah-size-14', 15, v_id, 'R'),
      ('ring-mariah-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-mariah-specs',
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
    'ring-matisse',
    'Matisse',
    'Matisse - Emerald 4 Claw Solitaire with Bezel Frame Engagement Ring',
    'Designed to be worn low set, the Matisse is an emerald cut solitaire that blends vintage character with sculptural modern design for an effortlessly elevated silhouette that features a subtle under bezel frame and our signature eagle claws, offering the perfect balance for those torn between a bezel and a claw setting. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'emerald'::enum_ring_shape,
    'bezel'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-matisse';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-matisse-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/matisse/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/matisse/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-matisse-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/matisse/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/matisse/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-matisse-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/matisse/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/matisse/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-matisse-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-matisse-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-matisse-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-matisse-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-matisse-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-matisse-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-matisse-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-matisse-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-matisse-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-matisse-size-0', 1, v_id, 'D'),
      ('ring-matisse-size-1', 2, v_id, 'E'),
      ('ring-matisse-size-2', 3, v_id, 'F'),
      ('ring-matisse-size-3', 4, v_id, 'G'),
      ('ring-matisse-size-4', 5, v_id, 'H'),
      ('ring-matisse-size-5', 6, v_id, 'I'),
      ('ring-matisse-size-6', 7, v_id, 'J'),
      ('ring-matisse-size-7', 8, v_id, 'K'),
      ('ring-matisse-size-8', 9, v_id, 'L'),
      ('ring-matisse-size-9', 10, v_id, 'M'),
      ('ring-matisse-size-10', 11, v_id, 'N'),
      ('ring-matisse-size-11', 12, v_id, 'O'),
      ('ring-matisse-size-12', 13, v_id, 'P'),
      ('ring-matisse-size-13', 14, v_id, 'Q'),
      ('ring-matisse-size-14', 15, v_id, 'R'),
      ('ring-matisse-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-matisse-specs',
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
    'ring-meghan',
    'Meghan',
    'Meghan - Elongated Cushion 8 Double Claw Trilogy with Round Side Stones, Pave Band and Cathedral Setting Engagement Ring',
    'The Meghan engagement ring is an exact replica of the iconic engagement ring worn by Meghan Markle, featuring an elongated cushion cut centre stone neighboured by two round cut side stones and a 2/3 pavé band. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'elongated_cushion'::enum_ring_shape,
    'trilogy'::enum_ring_setting_style,
    'pave'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-meghan';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-meghan-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/meghan/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/meghan/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-meghan-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/meghan/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/meghan/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-meghan-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/meghan/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/meghan/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-meghan-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-meghan-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-meghan-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-meghan-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-meghan-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-meghan-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-meghan-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-meghan-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-meghan-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-meghan-size-0', 1, v_id, 'D'),
      ('ring-meghan-size-1', 2, v_id, 'E'),
      ('ring-meghan-size-2', 3, v_id, 'F'),
      ('ring-meghan-size-3', 4, v_id, 'G'),
      ('ring-meghan-size-4', 5, v_id, 'H'),
      ('ring-meghan-size-5', 6, v_id, 'I'),
      ('ring-meghan-size-6', 7, v_id, 'J'),
      ('ring-meghan-size-7', 8, v_id, 'K'),
      ('ring-meghan-size-8', 9, v_id, 'L'),
      ('ring-meghan-size-9', 10, v_id, 'M'),
      ('ring-meghan-size-10', 11, v_id, 'N'),
      ('ring-meghan-size-11', 12, v_id, 'O'),
      ('ring-meghan-size-12', 13, v_id, 'P'),
      ('ring-meghan-size-13', 14, v_id, 'Q'),
      ('ring-meghan-size-14', 15, v_id, 'R'),
      ('ring-meghan-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-meghan-specs',
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
    'ring-meesha',
    'Meesha',
    'Meesha - Oval Bezel Solitaire with Marquise-Round Shoulder Stones and Cathedral Setting Engagement Ring',
    'The Meesha design showcases a striking bezel-set oval cut centre stone accented by round and marquise cut stones. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'oval'::enum_ring_shape,
    'bezel'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-meesha';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-meesha-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/meesha/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/meesha/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-meesha-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/meesha/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/meesha/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-meesha-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/meesha/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/meesha/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-meesha-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-meesha-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-meesha-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-meesha-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-meesha-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-meesha-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-meesha-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-meesha-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-meesha-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-meesha-size-0', 1, v_id, 'D'),
      ('ring-meesha-size-1', 2, v_id, 'E'),
      ('ring-meesha-size-2', 3, v_id, 'F'),
      ('ring-meesha-size-3', 4, v_id, 'G'),
      ('ring-meesha-size-4', 5, v_id, 'H'),
      ('ring-meesha-size-5', 6, v_id, 'I'),
      ('ring-meesha-size-6', 7, v_id, 'J'),
      ('ring-meesha-size-7', 8, v_id, 'K'),
      ('ring-meesha-size-8', 9, v_id, 'L'),
      ('ring-meesha-size-9', 10, v_id, 'M'),
      ('ring-meesha-size-10', 11, v_id, 'N'),
      ('ring-meesha-size-11', 12, v_id, 'O'),
      ('ring-meesha-size-12', 13, v_id, 'P'),
      ('ring-meesha-size-13', 14, v_id, 'Q'),
      ('ring-meesha-size-14', 15, v_id, 'R'),
      ('ring-meesha-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-meesha-specs',
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

