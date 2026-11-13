Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.58
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794583964;
	b=Ocq50E1H48V0Gp4+kDlWXknC2eQqoXC+LsHD7wXTpGwLLEmH6CyiF5BPy5j6knTkTIDj
	 A+rhWIcCjJ/xC3eMZchJkSew18i1+Ct2BwkQ8U/BtIowAoQMsOMCeqQ3GGVizAr1yhe1k
	 Hl/HOzDzKzctpVTbobI9LU64tXMl0hxWK4xB9YXO+Zr5o1OjNMb3aRUj8CrwgCaRBumYR
	 yTKeBVLSr+OJvQqsHmqP8ZK2TGX8FhCHJhqFgIfSUSqsy+hjQYPvyindEj/mUZ4dKjGmS
	 DBTN94TbBVmSPRZMPXhxqxC/sCnejvhlK6g7gpUcu1lwMmx0SEhP2KgJ5g7jlQYNEwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794583964;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=bvNkvOXezmjuj2NgjEjXOIyrbEQDPQ7zXLJoZzuvJso=;
	b=ha77yeocV3vOQRuZnEbgmLs/3hcSFX+f7XUtEIjusahEEjYSQiR2mIOrvXwq+tyeIce8
	 2KNs6ccQ4j1OzAfmcQAXerQCVFwoQs/YWXE113PCP8SoAwmMc/Om7rHEP62ASP7RKRT2K
	 7JYEm26u5l9LPFDQx5rW6nbGaKl7brUoUfPzwEviKq0EOZdymsIPPJ0ENfZHp+Bilh2g4
	 ynoldS1ZHtkLXW77VtPINgZcTe5G/0b9cktT7yzq8EfWPAkX0xSX4LxpCqz5L8dCw2CW1
	 b2Uj9YVM4AVKQdvb/+C7UIgFQ1FNkwgUMS70xh/cAN+Ep5EyFMCEidK9ILR0wi4Eu6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=AT5iCnu+;
	arc=none smtp.remote-ip=95.215.58.58
Received: from mta1.migadu.com (out-58.mta1.migadu.com [95.215.58.58])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D93860A2626
	for <driver-core@lists.linux.dev>; Fri, 13 Nov 2026 15:32:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D93860A2626
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=AT5iCnu+
X-Envelope-To: driver-core@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=gpudrF8e9c8S7xz2PdaClPQ2oeR8iHtL9/29e7yY5nY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794583961; v=1; x=1795188761;
 b=AT5iCnu+EUFIex5E6ZgqZgAL7F13A2TiathRoRxPPgyAc7HkTnqzzw1bjrUgO9TocyFQ1w9W
 C1UTIl5q4YNrDbzAdp49awAbZ50kPd7HqZP5a4/G0DuaHloMmC0LFjU+GPwfnqY8xRMVqaVvzUd
 Iu+THOfJdvNuaoz1cTc6oJq8=
X-Envelope-To: driver-core@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 7cac1438b6c61d50;
	Fri, 13 Nov 2026 15:32:41 +0000
X-Mizu-Trace-ID: 7cac1438b6c61d50
X-Migadu-Flow: FLOW_OUT
From: Peng Fan <peng.fan@linux.dev>
Date: Fri, 13 Nov 2026 23:31:58 +0800
Subject: [PATCH v2 10/10] regmap: kunit: add test for
 regmap_bus::init_limits
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-regmap-improve-v2-10-5dfd6a89078f@nxp.com>
References: <20261113-regmap-improve-v2-0-5dfd6a89078f@nxp.com>
In-Reply-To: <20261113-regmap-improve-v2-0-5dfd6a89078f@nxp.com>
To: Mark Brown <broonie@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Johan Hovold <johan@kernel.org>, 
 Lucas Tanure <tanureal@opensource.cirrus.com>
Cc: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.3

From: Peng Fan <peng.fan@nxp.com>

Add coverage for the optional regmap_bus::init_limits() callback. The
test bus lowers the raw I/O limits and relies on raw register defaults so
that regcache_hw_init() reads from the device during map initialization.
The readback must be split according to the limits set by the callback,
which also verifies that __regmap_init() invokes the callback before
regcache_init().

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/base/regmap/regmap-kunit.c | 89 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/drivers/base/regmap/regmap-kunit.c b/drivers/base/regmap/regmap-kunit.c
index c948219f46a3..f2fe2eef3403 100644
--- a/drivers/base/regmap/regmap-kunit.c
+++ b/drivers/base/regmap/regmap-kunit.c
@@ -2247,6 +2247,94 @@ static void raw_ranges(struct kunit *test)
 	}
 }
 
+#define TEST_INIT_LIMITS_REGS 16
+#define TEST_INIT_LIMITS_MAX_RAW 4
+
+struct test_init_limits_data {
+	int num_reads;
+	size_t read_sizes[TEST_INIT_LIMITS_REGS];
+};
+
+static void test_init_limits_bus_init_limits(struct regmap *map,
+					     const struct regmap_config *config)
+{
+	map->max_raw_read = TEST_INIT_LIMITS_MAX_RAW;
+	map->max_raw_write = TEST_INIT_LIMITS_MAX_RAW;
+}
+
+static int test_init_limits_bus_read(void *context, const void *reg_buf,
+				     size_t reg_size, void *val_buf,
+				     size_t val_size)
+{
+	struct test_init_limits_data *data = context;
+
+	if (data->num_reads < ARRAY_SIZE(data->read_sizes))
+		data->read_sizes[data->num_reads] = val_size;
+	data->num_reads++;
+
+	memset(val_buf, 0, val_size);
+
+	return 0;
+}
+
+static int test_init_limits_bus_write(void *context, const void *data,
+				      size_t count)
+{
+	return 0;
+}
+
+static const struct regmap_bus test_init_limits_bus = {
+	.read = test_init_limits_bus_read,
+	.write = test_init_limits_bus_write,
+	.init_limits = test_init_limits_bus_init_limits,
+};
+
+static const struct regmap_config test_init_limits_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.max_register = TEST_INIT_LIMITS_REGS - 1,
+	.cache_type = REGCACHE_FLAT,
+	.num_reg_defaults_raw = TEST_INIT_LIMITS_REGS,
+};
+
+static void test_init_limits(struct kunit *test)
+{
+	struct regmap_test_priv *priv = test->priv;
+	struct test_init_limits_data *data;
+	struct regmap *map;
+	int i, ret;
+
+	data = kunit_kzalloc(test, sizeof(*data), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, data);
+
+	map = regmap_init(priv->dev, &test_init_limits_bus, data,
+			  &test_init_limits_config);
+	KUNIT_ASSERT_FALSE(test, IS_ERR(map));
+	if (IS_ERR(map))
+		return;
+
+	ret = kunit_add_action_or_reset(test, regmap_exit_action, map);
+	KUNIT_ASSERT_EQ(test, 0, ret);
+	if (ret)
+		return;
+
+	KUNIT_EXPECT_EQ(test, (size_t)TEST_INIT_LIMITS_MAX_RAW,
+			regmap_get_raw_read_max(map));
+	KUNIT_EXPECT_EQ(test, (size_t)TEST_INIT_LIMITS_MAX_RAW,
+			regmap_get_raw_write_max(map));
+
+	/*
+	 * regcache_hw_init() reads raw defaults during map initialization,
+	 * so the callback must already have set the limit which chunks the
+	 * readback.
+	 */
+	KUNIT_ASSERT_EQ(test, TEST_INIT_LIMITS_REGS / TEST_INIT_LIMITS_MAX_RAW,
+			data->num_reads);
+	for (i = 0; i < data->num_reads; i++)
+		KUNIT_EXPECT_EQ(test, (size_t)TEST_INIT_LIMITS_MAX_RAW,
+				data->read_sizes[i]);
+}
+
 static struct kunit_case regmap_test_cases[] = {
 	KUNIT_CASE_PARAM(basic_read_write, regcache_types_gen_params),
 	KUNIT_CASE_PARAM(read_bypassed, real_cache_types_gen_params),
@@ -2290,6 +2378,7 @@ static struct kunit_case regmap_test_cases[] = {
 	KUNIT_CASE_PARAM(raw_noinc_write, raw_test_types_gen_params),
 	KUNIT_CASE_PARAM(raw_sync, raw_test_cache_types_gen_params),
 	KUNIT_CASE_PARAM(raw_ranges, raw_test_cache_types_gen_params),
+	KUNIT_CASE(test_init_limits),
 	{}
 };
 

-- 
2.56.0

