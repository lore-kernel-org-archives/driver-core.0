Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 512853264C7;
	Tue,  9 Jun 2026 16:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781022288; cv=none; b=NXUL6eRSgR/vO4+MDqflEEYUAfC6M2Xx6DCsaecOZB5VaIApzgvqkNPL8FCL4jQ5JW94Hv2q5NjlGIJ+YWleaxE0bmRFMVG4xQXjMAMxdj8TuCHZswOSA5+C6QvszkYTMYsAVsMROdHRa73a+f2UK4C3UZ6AqBqInX8R/zxZFYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781022288; c=relaxed/simple;
	bh=l/BojZwBs1Ah1zEY+0JKqQ0eRkQ1alH4ho21Vg7Zv1s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=QZEif6CAG7xLRWY1l97rMVoBe+ay+3NVBMIFOvOlqB4I/TS1hzY51mPFflogl6GNNmGTV7jEI0ZGiTQseM7XxTwk0I0kSUcEM5ksS4JBpGU/opU8DVd3JpUM54yskYckQ1kvvEyPd1Bz761RDGAP0f6XI20d6AYLIOKYCwJprUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=WAya3lNL; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="WAya3lNL"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:In-Reply-To:References;
	bh=hNNSQZ1LdbCoH33k8zpz0grx4gfssTDmezB1C1lNWCU=; b=WAya3lNLG4tdoc9v9jwuQ6hUzB
	cRbhDhhLPjk06EkIzoVqN/y4HZ8xEtbRkFMnPYekbRF2F2IQ3gTSPauqXDbyoCtawWh224Nd+C+Mm
	xOG018n43bdUbastQbytyZ6bdYtvRkpHCX0/+UtjUc2uHOtIaTCZ+j1M/D9Xor6SczCVvTUThmhkw
	zpiDRGh+MJ5kNq91dDuGb9J3Q6I3NXOz+XcZ5nBxDOAE+UCXxJg6S2YYiT7NpVI74m8td0JJBo2hl
	DbSNeCdOk9jdb8+bZZ3nCUJZLTJ97KZ4fpqy6stHjvBNikTaZ4TaDwyO6Go0BpSTGGQpaV6yX90p7
	+FkGDfuw==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wWzFn-008Wxk-2m;
	Tue, 09 Jun 2026 16:24:40 +0000
From: Breno Leitao <leitao@debian.org>
Date: Tue, 09 Jun 2026 09:23:53 -0700
Subject: [PATCH] cacheinfo: don't propagate DT/ACPI error when arch
 supplies info (arm64)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-cacheinfo-v1-1-35864c9a8f0c@debian.org>
X-B4-Tracking: v=1; b=H4sIABg+KGoC/x3MQQqAIBAF0KsMf61gLqy8SrQwHWs2FgoRSHcPe
 gd4HY2rcIOnjsq3NDkLPA2KEI9QdtaS4AnWWGecmXUM8WAp+dSbDVOyYxjmyFCEq3KW57+W9X0
 /xh4JYlsAAAA=
X-Change-ID: 20260609-cacheinfo-b2a8d27a19ce
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Sudeep Holla <sudeep.holla@kernel.org>, 
 Pierre Gondois <pierre.gondois@arm.com>
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
 kernel-team@meta.com, Breno Leitao <leitao@debian.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2117; i=leitao@debian.org;
 h=from:subject:message-id; bh=l/BojZwBs1Ah1zEY+0JKqQ0eRkQ1alH4ho21Vg7Zv1s=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBqKD5E2lKKuKW4k7q+usjAcuBuHmcocWNx+Uv41
 2+IMpYaIbWJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaig+RAAKCRA1o5Of/Hh3
 bedcD/9XSmjdp9476exMfFOVww4OYu7SCYCKrRXvrK5bdVqRvGvj/vuBFCnSpT4FSIvQuOcBaDb
 1xNfOJaOK6g5BcbIMwAlVtX3s8A/nlp4oGGU/jEulLvja1G0YUWQvyFnHs2XdyzFqp9zcC2J2eT
 PwjqsJypLDXldY3DrvQTxT1i2eXzQnCUDqI+n2AjesRsACubdtDb8b4zOEtZSQiNiEMXt/8hhgU
 5DrzOo32Mpoi0LTdhMP3i7iir/AA38K+XgWBBCiCQ92UBuiw08M+12I8noOZvD7u2DUTo3LBHnG
 cNlNIOlQtiERFFHbbMQCOy92bDuL4WN2IX1WM5YbxMIbDCd59kiORllYOlK+bxYMPTmzgL8oDvk
 whcwiuc23orYZ9W3lQ99ynkwdn9An1ekMmfLii19wdzAA/9ns4Fl6h5U1HAn11qagQQsnJDWVMh
 wEDANNhMxGcAMSZtEUkgpbcFsOLTHG/nPcnuSSaEzhGqqIJhq6JLcAsscRqHoOotOD5mAY2AhHT
 z44KtsogwfSH43+l0VcrhPg0DQrzkchQzp++yd/TSDtTXUkA8FfmUGaVHdERsPBbR+0dTjh2CmU
 x4o2BWzy4efFOexa+XbtbwKKSMgKT/zD//0Qo3FXQ2BRhC7unNw296nVcctvnr9flHzNeLYtBEm
 b4TwlQZAZBzI5hg==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao

cache_setup_properties() sets use_arch_info = true when DT/ACPI
provide no cache nodes and the arch can derive the topology from
CPU registers (e.g. arm64 reading CLIDR_EL1), but still returns the
original -ENOENT. cache_shared_cpu_map_setup() bails on that error
before the new flag can take effect, so the first CPU brought online
always trips a misleading warning:

  cacheinfo: Unable to detect cache hierarchy for CPU 0

Subsequent CPUs skip cache_setup_properties() entirely because
use_arch_info is now true, which is why only CPU0 hits it. This is
reproducible on arm64 with the QEMU 'virt' machine, whose default DT
has no cache nodes.

Clear ret after setting use_arch_info so the caller proceeds and
populates the shared cpu map via the arch-supplied leaves.

Fixes: ef9f643a9f8b ("cacheinfo: Add use_arch[|_cache]_info field/function")
Signed-off-by: Breno Leitao <leitao@debian.org>
---
Cc; hruben@meta.com
---
 drivers/base/cacheinfo.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/base/cacheinfo.c b/drivers/base/cacheinfo.c
index 70701d3bc81c..4e11d36f127e 100644
--- a/drivers/base/cacheinfo.c
+++ b/drivers/base/cacheinfo.c
@@ -401,9 +401,18 @@ static int cache_setup_properties(unsigned int cpu)
 	else if (!acpi_disabled)
 		ret = cache_setup_acpi(cpu);
 
-	// Assume there is no cache information available in DT/ACPI from now.
-	if (ret && use_arch_cache_info())
+	/*
+	 * If DT/ACPI lacks cache nodes but the arch can derive the topology
+	 * from CPU registers (e.g. arm64 reading CLIDR_EL1), fall back to
+	 * that path instead of propagating the error.  Otherwise the very
+	 * first CPU processed trips a misleading "Unable to detect cache
+	 * hierarchy" warning, because use_arch_info is only set after the
+	 * first failure.
+	 */
+	if (ret && use_arch_cache_info()) {
 		use_arch_info = true;
+		ret = 0;
+	}
 
 	return ret;
 }

---
base-commit: a87737435cfa134f9cdcc696ba3080759d04cf72
change-id: 20260609-cacheinfo-b2a8d27a19ce

Best regards,
-- 
Breno Leitao <leitao@debian.org>

