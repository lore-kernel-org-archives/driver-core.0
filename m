Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795685789;
	b=u9hYNVDFENiX0jv3QSf0AfNLXVh1v2et/IAbJ6TrtlilTU2aEJxMQ6EHcm7PWuaBXtEd
	 lupwy4cLzAz4zDQvaq2GxeRlkQc9WHzLI71HRpl/9mh5MHpVllLPINf0rHtLkWxEcc/5S
	 p8kY9LdlgW9MgdZfRV+FXh49nma9JcnLKjSowEIcNNOFSJ2tEpFL03eLZQNVsQ59x+RQT
	 Qw8ryy2HwhZNYtJBHJ3q9IWpbR5rd2b+sblvrCaoqf23pIB4R6sFPXHMCpzKIkxuYuRPl
	 X7qgxHM1ukN62NNGcLrmfAqR2UTJOeFAJymyPQPGOzYTcPMuImu/TDQz4gWBTk3XXqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795685789;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=05HkMf4ygIqtlQzRN7ZbpqVF0GJOazAPdTl6j41Coks=;
	b=RZ6n7TRM/xdFgurrRMk1T8dDsE8Pb9L4B8+wShUaGLwxM7PWKl5ZP1/EkEKgDzhIpUke
	 1oJIHCPYYWawKfF+Jzd1LRtI+gPTA2RR8x8g9jlXCK/fBtwLeLdOlODcxflxSWM0atUg/
	 IQgkn6jfpAwatQedsVhxWdDrsMoajppYWpa6IKyJJDWqFHO1kvyg2vNQepgIQ8m8U9feO
	 tK1NbGxSIGIDi2YiMWn5RRguhr5504yo+6iMwSvdHN+8+idPqC8/kq1vWawbp2hiZPK9f
	 JlBQrbYoKhSrAII7dR6KN2Bn7qgQNuduLxhAYR+4RJ+l2Jicv/keoOeIPcN4BlEutsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NIXVhnzH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kA1FP5qu;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69899606A339
	for <driver-core@lists.linux.dev>; Thu, 26 Nov 2026 09:36:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69899606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NIXVhnzH;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kA1FP5qu
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7Aru52885418
	for <driver-core@lists.linux.dev>; Thu, 26 Nov 2026 09:36:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	05HkMf4ygIqtlQzRN7ZbpqVF0GJOazAPdTl6j41Coks=; b=NIXVhnzHgu082yqW
	abalWNzDOxFZhGuNyI7ByVWj6XtldAX6FNnRjk1R3+UFYJawEMNoJZxSHvaHd1aa
	y/lylYTrMZMQPJjTH1xQ+WuXNYh//2rPDLR8TVy7nTNgJKN8EYGHFJGqkbjlrfk2
	HmbGJ+iFyZOW7sIfJzapKHmwx2uBeRjpcei/L75cvpnGBtL5uyde+1cjyB3jPOdu
	eUKoWKk2JIwfQBAocqIGMVU9nxYYTmjxMaD6TznCOscivByzNo+H4jWYMNLqqPN7
	xOuOVl859J0HizB7ni5LBcLUFJU99ngJ6vbqAZbaG8iD6rDY7wb+XX5lPB06zm2C
	iAOWXg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6f8rgsu6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Thu, 26 Nov 2026 09:36:27 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9495c71055bso370127885a.2
        for <driver-core@lists.linux.dev>; Thu, 26 Nov 2026 01:36:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795685787; x=1796290587; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=05HkMf4ygIqtlQzRN7ZbpqVF0GJOazAPdTl6j41Coks=;
        b=kA1FP5quYNE44J6KkKvlWfmcM8abdPZJqGFm8r/5azdtb7xY2OqU++8qrBzSpIfFrd
         DMrxsMysyuOJ64Ad7nBP0cs7a23uPvoJFzQ4XyZRTNuzi+B4b7qJC6Gq9o59amXly7J/
         XLqrsunobtk9VS1wRnp0iK72jOYul/Q0USl1Ow9ULmsF/kMr431GO1Iof7xnjZbj1X2b
         ImQxeP75kfcavorDKld9U+JArhQY3Wrt+Gax1KU3kgHsT63KfY8nUV3ljtEKKv7rXyac
         w7PkO4eW1g4nMSw5thYky/+2ewiZZfJuaNofpM61mUimGgvrmJmqskb/ZShAQyiNpWBT
         XC/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795685787; x=1796290587;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=05HkMf4ygIqtlQzRN7ZbpqVF0GJOazAPdTl6j41Coks=;
        b=Eixz0RG8cBn3AIsWuI1wDfldIH65EW/+o1VqJ/EVY1KqcOb7upajZeSQyspNkH2WQB
         haVmYxee/lcu4VuUlUs4DBxIzssEg7TlZg36e0fqu77EL1/NMIdvd2bu0of4S+D2qR1M
         dv0vEyg2DWnhm0eVfXWTOny2xsLAAzMR6lZT5Ris3lV4IhTVzh6gyHQ8NksmXKAkhg1Z
         UHtsptDZlL4IrVa+yzR7sqVilxKcJA6EHggQAMBs22hwnMjHjrDL/f5PnnqDCZtnuO47
         uXIr4Rrn33GjodK8SlbfCYAeuFPRb0O94FduNqimObBeuz1A+IRRA/L2CYQsljpcnNFK
         ct9A==
X-Forwarded-Encrypted: i=1; AL+hErEUC0EXd2qJhfHZ2mHg/rllTTAuTgeHj6rghb1KAH9up54iie6OkVcFp/c5Swgv4Eqi3aLASjHWIjJonw==@lists.linux.dev
X-Gm-Message-State: APuU4Z8hq/UIbn8BoOKYlNgzdN7P6DC9hCzpdOz1JCSLQfDl6Q7CXVki
	lgq19ET2uYs148u46Jbv3rcrLNpjtTrTZ+ReUbglUInoe1NWZXYPbFEPiEs9oQMximFRLlMo+js
	Q/kt5H/floN3E2rDxmDQo7nmDae+Td41hzBMN+QY4sHBo7sZylzo39UMpurweaDwaUA==
X-Gm-Gg: AZFdTZdUX8lMDBWmpv18UOMGlv2wVWxLaf1TB+q+PC6/zuBIS1IFt36rj/byb7x+Crs
	qa0TeNnyJCitLlQZq8KyOUl/cZOQRc3nJArF7UyXgXRwdO9ZjTb2joh9nUUpaIp2RJaM7uFel4w
	SnnvUxnBCBKx5OvgUgXT9AQuMTgy4cLNEl18BbwsUaynnNc/2VG7LGvTeYw4Uiove4pvHoLEBan
	rzfBNMbQ+F6W/f/lpBx1avBiVf6JfqUGY5/3KifF0LBqjUGjQpcua3eqGF+hSb+lw4IK47jZa2e
	ODuNFXrpW0+0OMOvCDRv+Q1Ff2eA9IeQbATTgRyIHNBLAFbHQ+esR7LsHtuojNv27RunZwUlcEu
	PxSSLfXmPeLfTkG6cerbb+O9CPreHtobbOZlpaqxMERSuXoGfc/tZ7MxEIkOTXPfiPBCEP+v1rl
	Cbzw==
X-Received: by 2002:a05:620a:4446:b0:949:6574:f367 with SMTP id af79cd13be357-949bac8c5a9mr3645414085a.80.1795685786690;
        Thu, 26 Nov 2026 01:36:26 -0800 (PST)
X-Received: by 2002:a05:620a:4446:b0:949:6574:f367 with SMTP id af79cd13be357-949bac8c5a9mr3645411985a.80.1795685786268;
        Thu, 26 Nov 2026 01:36:26 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8960068fsm227079335e9.4.2026.11.26.01.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:36:25 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 10:36:18 +0100
Subject: [PATCH v4 01/10] lib: string_helpers: export and rename struct
 strarray
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
Message-Id: <20261126-fwnode-for-each-prop-v4-1-d4b370ecfd52@oss.qualcomm.com>
References: <20261126-fwnode-for-each-prop-v4-0-d4b370ecfd52@oss.qualcomm.com>
In-Reply-To: <20261126-fwnode-for-each-prop-v4-0-d4b370ecfd52@oss.qualcomm.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kees Cook <kees@kernel.org>, Andy Shevchenko <andy@kernel.org>,
        Len Brown <lenb@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-acpi@vger.kernel.org, driver-core@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1964;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=hYScHpsRvvGBrMd1w71TLaQh4T+I7gIpjdQzKJBQdf0=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrB/2Tb3bU70k5uNCHd9DHKLI7AbP4/lR/4ThiP
 pB9xbKGQFmJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawf9kwAKCRAFnS7L/zaE
 w0vSEACwAuSF5pl297MCgnmYK8Yx/HwO0ljwt+t8ccc8bpUGvx2jbcf2rDjTxnwzOuGQX68E9qn
 AHKXALKHUnUZS/uTHsbtEhU9F4S4EW14tOCqA87Giz5SHfWhgTfgKgwZoViFwveppCrg8NZmrLY
 X/WsJ04SptxP1NSU2RJee1r9IORHFOzFZMJLDbselGbIQp/qk5QQqmfzeo6+Epv3jRtF1c6dyYp
 sb0mR9B5mFraz3sfOPjX1fzbtwfVXoV4+AEOZY1pJglVaDPxvtLVhCl/rhloqFmCo7z6wp2cCSA
 OmlIfaokYSWE33yxltAu10AB8MZDBB9xm180nqQ+jQbeWSuuiay3N2RCjjsANEmiGBXqiWbSPk6
 Z+wKVa7f5yXFf65X0gO9RJ5bruxLNC7hhoSRxKImvqL2d+GvB8YukI90AadieAdyl35efNJtkOE
 RzLBI/RjMhlmOXY0iATAPVuOVb+kqAPJEVDhn41vM5hGekJ8Eak6iKn/PY0DEPbEt3M+Sz65fdJ
 U52WP61v0Uju2OXgKK97CxaYlpQTqws7Ija56y57kW3rzcUith+JsHzNgFqx5UUc6nobuKdur1G
 2IdeHPUaNO+jU8QPeRKkaQjxMYJeM3JJzyXoZLaTkhl4F/QDiU9WgZqOovcvQVmvEu+fHY/Ne0x
 GakZ0caFYJxEevw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzNyBTYWx0ZWRfX0u2fED6N2RkI
 7JFJneGsrcXLizx70w6DAqqRFnItEl9/ryi+Ad9MZzgWQz7/FoXZfFw2K5ggn+FIbfpv2v/t5yh
 0Ck6Led3PJ+K7pdeSLf/s0GQ4GTZJ5YGy4nlfd6AfN+DQS/ziiLdI8F1xegiOryPTCNEhogezL7
 FCOCs6Nsd3KMtrKoF0lsX5hgOKFPwqZoG53TphmYsFIyMja0HU7DRkSFBkhXrNwVW3ipbEFCBeh
 1DV0GcXvj6sx+n2giGOPQFwOP/TuIoklLXxOvkwX7FZNJjrLKKJUj0Gzv5ULnwXujqR4orQjGO6
 UeIajWfM5eYcwishXCKJzmniDFMsIaNfDQGBRrHZPo+nQ6cWyG+2VjjlWDB1FvMdwmkABnh8853
 vKGz1qUi9OY6TnuCaTSVxa2v2Y690tHj2Ozda5I2EsOHVM+mNT6eCEzIqxG2VabmHkFxXAhSbU9
 anev8rvDb5ZAL8/c9dw==
X-Proofpoint-GUID: lVRlUdh_HiJKJ5vB-4cI3hftCl0hOnvh
X-Proofpoint-ORIG-GUID: lVRlUdh_HiJKJ5vB-4cI3hftCl0hOnvh
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzNyBTYWx0ZWRfX7++LYGsFZsm4
 4I2MJc+fQRf8khziQu3yLITU6nvl2aB0PwqiU9kKNVpDCSw4ire5vhvw4hnrQYB9y9pY5MfCwiU
 CmdBiWzFs/BP/ITMMJOyBSFYgX2NB8s=
X-Authority-Analysis: v=2.4 cv=FuOQbGrq c=1 sm=1 tr=0 ts=6b07fd9b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=QyXUC8HyAAAA:8
 a=EUspDBNiAAAA:8 a=NBg0Ud2t-6tr7aH_vnkA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0
 suspectscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260037

Ahead of introducing a CLASS() for string arrays, make the existing
struct strarray public in linux/string_helpers.h. Rename it to kstrarray
to avoid any potential conflicts in the future and make it clear, it's a
kernel type.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 include/linux/string_helpers.h | 5 +++++
 lib/string_helpers.c           | 9 ++-------
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/include/linux/string_helpers.h b/include/linux/string_helpers.h
index 3fb88a1e989833ad5ea1a46858efa16e3971bf08..c9f08066439bdd33cc26e2054dbe1ba2e867aee7 100644
--- a/include/linux/string_helpers.h
+++ b/include/linux/string_helpers.h
@@ -116,6 +116,11 @@ char *kstrdup_quotable_file(struct file *file, gfp_t gfp);
 
 char *kstrdup_and_replace(const char *src, char old, char new, gfp_t gfp);
 
+struct kstrarray {
+	char **array __counted_by_ptr(n);
+	size_t n;
+};
+
 char **kasprintf_strarray(gfp_t gfp, const char *prefix, size_t n);
 void kfree_strarray(char **array, size_t n);
 
diff --git a/lib/string_helpers.c b/lib/string_helpers.c
index 98d6ed0eaab7e9f3d54e420c404629a28b925bf4..8ec7ff6dac1212fe8a1f242654944ba6e5568e20 100644
--- a/lib/string_helpers.c
+++ b/lib/string_helpers.c
@@ -804,21 +804,16 @@ void kfree_strarray(char **array, size_t n)
 }
 EXPORT_SYMBOL_GPL(kfree_strarray);
 
-struct strarray {
-	char **array __counted_by_ptr(n);
-	size_t n;
-};
-
 static void devm_kfree_strarray(struct device *dev, void *res)
 {
-	struct strarray *array = res;
+	struct kstrarray *array = res;
 
 	kfree_strarray(array->array, array->n);
 }
 
 char **devm_kasprintf_strarray(struct device *dev, const char *prefix, size_t n)
 {
-	struct strarray *ptr;
+	struct kstrarray *ptr;
 
 	ptr = devres_alloc(devm_kfree_strarray, sizeof(*ptr), GFP_KERNEL);
 	if (!ptr)

-- 
2.47.3

