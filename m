Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 038683D9039
	for <driver-core@lists.linux.dev>; Thu, 30 Apr 2026 07:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777534468; cv=none; b=ZI417DRZMZ9MV1tmz7X56Zp9+Y3Lo2RB1vSOH/QlGOxRCyZJbfAosg57ITAMTnBJIJRzSRfOUG/69890bSpclH/GwwA8R1cQFIIIM7hdkZ+q4B8+U+DC7T0ryPrMMMDLKH/sW6oI/wwQphwOqr7VdpzasPESMFALLQC6Hq2b0IU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777534468; c=relaxed/simple;
	bh=0isVpghelXoSKwPd5BDTOfUOhe8G+mSFyfnWyqokP+g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Mm3H0cLpSpENg3n4JK+0NhQyPhgIJA+DMpHP6HYzR6/7TcYuAcH1iqg3ddgi3d/BuDiipcp8VpSa8Qrcr6FoUwrJPMJwDVH2U55Siw0hJICDKrHEyDj3URJh7N72IMZAkRnXajxFpEkbEYHH5lLFwfiBgePUhcI2I/D54klJNs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q3yCv+eO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cfa6dt5M; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q3yCv+eO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cfa6dt5M"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63U753pO830424
	for <driver-core@lists.linux.dev>; Thu, 30 Apr 2026 07:34:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+SWNLR9PCkztSIAkA+PWHwuqxCpfkGWdZHp+l4RUhvE=; b=Q3yCv+eOgXQ6X9GR
	HugoST/ZYazdpYD04NUoQfKTPUUUkr+bviWG894/1rte7U6CCzEsLSKw3u0fixOZ
	Mqc+GfJzjuqLjeTcsSH9K3CkkdBO1et1je2keJEH9RHpJkLVXmbI7jZdL4TwPhTe
	eU+LLvI5V5kukD+yX1NVQewxDj+BQns2jvR8XckgbGXpzoZcAZXzQw3PIB26lbDw
	Nig/WDbQbohnZLBi/wsPrf2HuH9i2SHYgKh2kg1ydmu+Pv+3Eu9Sp1uM+VS9cCzi
	b5+z1kE6DDrHbpE6FbHWe5y5ONfXO17QZX4UBdhTM7/SBOvifI7mkDEJBA62xd40
	0dOcXg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dv2cq03ct-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Thu, 30 Apr 2026 07:34:16 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d890580e1so1054691cf.3
        for <driver-core@lists.linux.dev>; Thu, 30 Apr 2026 00:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777534456; x=1778139256; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+SWNLR9PCkztSIAkA+PWHwuqxCpfkGWdZHp+l4RUhvE=;
        b=cfa6dt5MLzKuNmBQXVM33KV4y0dGp2Jqb5HLM2/ErUcni+yk6+AzOMTBrZSKLUlPo1
         BU4lWptV+pn+73rFJTBeJXjqyGd/9RAfRR0Nyq6r1gkxgKFxagFVSGB5+BGnb3bBQ5dZ
         L4/cO/E8ke4VtkWsGMGGown6PNIBZz/UKsnRiDkhzjGysAd0LHz6wnFpCrJU3sxZKt9K
         zGO+0yF/dpxV0Q/HuMd1Vz5Q//5wRF2EoXvr9vfbnRbTyh+k0gud2y+JW9YkZB3hfv6K
         AydZFa5OS/86rC/OHFW/SeDBstfFmgTndc90rolon80MRKI4caR2/cHQ1XBa+m0xknwk
         U8dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777534456; x=1778139256;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+SWNLR9PCkztSIAkA+PWHwuqxCpfkGWdZHp+l4RUhvE=;
        b=NViSBXn1VA1yHg/7ONMPaZAWQbLmRjusmVMQQBA8dZq8sIlHQ9IurFwkn/6nl85ybB
         TchnS5TdATx08G69Q+1lbz0jWvGWhR6dsW7tCOuM1eTgdPzK42X59xfWyDFj6dr4HO3l
         XzMdv9C205sQX4qv7+FcPJLt7GhNPCil1QiU6zzhuQ3pOQzbK659Li0HHy4QCFwW/sdh
         zZPZzH8TG1uzoEW+DH6fLwCule9RYawBh2pjsRIDgdB/7UAbdZA5+/WT11C7ECIeupPf
         SPhBImjY/0p5wP4imJ1RJQ+l47FTjQPJfNIm25BLb3EY+Ugxs4DBvsO8yyqd5pVtCwD1
         5eZA==
X-Forwarded-Encrypted: i=1; AFNElJ9WH5XyZmvChii1J2qaHs2lgxjclwwVeTc/awXP/jOBA+fdd/GR+igWGMUfQABUMJGYzNQqE7IqRWP+Ag==@lists.linux.dev
X-Gm-Message-State: AOJu0YzY+aeTevIgkDgLCp5k2CncdqxFI3GpNzGS7KMrd5kM1rJ8PKmw
	ZMOppcx91nLnxLvO26zMp6B+FqTqwNVKxiVCdTfJ3xKfn3FSnT8E56Bgfcl1ykO2gOnJkytegr6
	DYywzkjTyHpckClcDLk54z5Z9BKwsxK9oATLj4CbrveKMgaqI2pqcxJEj/ZK5QtocMw==
X-Gm-Gg: AeBDievr3bOOSN+UWRuYxo20QpQvi8y6UsJ2bCR+he0xmxIuKl50L0jqO0nF5eO4942
	j4rxoKLSG7AP2IPwvayTrE00fiDR3zqhEunz8du8i0eJD+RSwCJ5wWHG8F/E7KcvV/U3eBK3zC3
	+g9kaRLdv/ZeIyuvRIGCs+zn6zvooW666vs10n/9NUvvpQ+HXXUBSGsOzERslVWPrG/zHaQ0us9
	nTBQRvZgTomgxPH1HKE8uke7NjoyWRYcgzydodEgDd+0ZvIWxplc3LFuplJAXlPNOGbCJhREXTE
	+k92nk2+CRWTV0hHfDycWiZOJL+v3nC+9iABrwm5eq/6j3tx5IqH5aO8Jm5XeE0wCuKfpfcGZqZ
	HvYjt/N+RvgcuJyfjunuZAKnwqVw3Nu6O0eeUDO4hPnjiT/Tz5i+oizJZEFQk
X-Received: by 2002:ac8:7d87:0:b0:50d:9b4a:e6f with SMTP id d75a77b69052e-5102aaebd3fmr22953961cf.1.1777534455737;
        Thu, 30 Apr 2026 00:34:15 -0700 (PDT)
X-Received: by 2002:ac8:7d87:0:b0:50d:9b4a:e6f with SMTP id d75a77b69052e-5102aaebd3fmr22953561cf.1.1777534455111;
        Thu, 30 Apr 2026 00:34:15 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:79a:f446:21cb:22e7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a81ed6bafsm76132625e9.2.2026.04.30.00.34.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 00:34:14 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 30 Apr 2026 09:34:05 +0200
Subject: [PATCH v4 1/2] ACPI: provide acpi_bus_find_device_by_name()
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260430-baytrail-real-swnode-v4-1-767bcda6667f@oss.qualcomm.com>
References: <20260430-baytrail-real-swnode-v4-0-767bcda6667f@oss.qualcomm.com>
In-Reply-To: <20260430-baytrail-real-swnode-v4-0-767bcda6667f@oss.qualcomm.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Len Brown <lenb@kernel.org>
Cc: linux-acpi@vger.kernel.org, driver-core@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2038;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=0isVpghelXoSKwPd5BDTOfUOhe8G+mSFyfnWyqokP+g=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBp8wXxZC+mASP2ppNNMW84j+0XxHWW5nI+GRHzG
 tayHaJ0nXqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCafMF8QAKCRAFnS7L/zaE
 w8dgEACegJw/nKBn+I0OhND1U3+dBoBHnWiTymvDzlqlzPb8Kqo6c/IazxlfmWakeZi6zVfDURg
 j/0slWcp1WjemC8d5k/wLUlm9a485s+uTHg/bCwtmYkyjbwem1uUtqttqq/q/0YH0A95OXrU9I/
 FLMBxbaUleTzwkszDnqDBvwIMHNn10SwZ4X/qk6iR84oXEo2moYEFECFlkljqfwQNu0H9/o5dVK
 XuGoydEaaKrCF4mjQl+MpBY3OwK4cUsqZA/WoqJB5oR/6bqBPX68UiDBLgFxBvbKi/Rt0w3m3wU
 HbK2hc3Ll5MGRnrQmdbgo2t3jfEju1a41cHic6lAXdVD2zNThthh+Swleir8MLduY7XqETGRdc/
 0XbWPfROHaZU+no7NRmhZmZk5ZhvnNj+HKKMsNJH9r0sVybVTLgRhVXfi+FDQAlpbGRNIpDHR2r
 aYayi6IzNR+QmpuP9hVwpH8dwKzesqggOIChdJlWufiEGUgGv3N4Fim1RfzgqXnsMFlCF1mA2k+
 a4pe7kb9CuPYtwlwVtpsXpyUNmMxBVISt+v42bTwJ/ixvHQa5bh37O04OzvUGoADJBfEPs+clCt
 pwT3ZDhtN4EDdXp+q5JO0rAfMFARf73MtQbXpt9P+VeSAuZXYhNb1n161BgMBv/ay8KDXP78imI
 RUvXZ6T5ahpsVHQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: v9u-_PW0CkWW-b8tYvILGSGL1OkfNAOf
X-Authority-Analysis: v=2.4 cv=aYRRWxot c=1 sm=1 tr=0 ts=69f305f8 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=B8ktV2ObmFyAxeXX9HEA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDA3MiBTYWx0ZWRfX5oXROqPguLxC
 fKb88QrCdMo7jviBAJWAG0ASfjMk0Ikt/q3WnMXj74ihPi8YnC6GqQzeZraLn5YTQP7TzYNnYd0
 5dlpz2PaXbdRUhyyeXKkk8LG7qiHM+91n9qKPkN6t819XiuS2cqUeJTpemhI5E24T+CHnaswKmI
 dtnqVom9AEKG3DAynUixp8Ao9vnVaJtdRiI1SeN8T2RZcxUYDtffg68aoF+/l+zh6V9vnIt40ap
 5kVBKKoc1MDr9vi1Fw858nQ103K2UMAHf0JbbiNG0mx36ene7wYJxiPJtJY8jxABmgfeIvLOe/W
 G/OgKb/qVTf0cKKv2vd6/Bv50qiab+Sygk7uEF16ARQr9ohkTOOmN+I3H+ntVsGh/iZzcOCXq53
 XSmpQh9n4MfhO3NwAbmfrhIiTZGqHfjoxdQZQHHWWKgUSk4ecnOPoANXSm6vHNOeyYFJibZ6uYx
 1EDtGtNAumLwBmoxKSA==
X-Proofpoint-ORIG-GUID: v9u-_PW0CkWW-b8tYvILGSGL1OkfNAOf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_02,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 clxscore=1015 phishscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604300072

Provide a helper allowing to locate an ACPI device by its name.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/acpi/bus.c   | 13 +++++++++++++
 include/linux/acpi.h |  7 +++++++
 2 files changed, 20 insertions(+)

diff --git a/drivers/acpi/bus.c b/drivers/acpi/bus.c
index 2ec095e2009e40b0645f654fb051429e5679dc7c..5dd8459be03db4165bcb59943b94ea7db273ad7b 100644
--- a/drivers/acpi/bus.c
+++ b/drivers/acpi/bus.c
@@ -1181,6 +1181,19 @@ int acpi_bus_for_each_dev(int (*fn)(struct device *, void *), void *data)
 }
 EXPORT_SYMBOL_GPL(acpi_bus_for_each_dev);
 
+/**
+ * acpi_bus_find_device_by_name() - Locate an ACPI device by its name
+ * @name: Name of the device to match
+ *
+ * Returns:
+ * New reference to the matched device or NULL if the device can't be found.
+ */
+struct device *acpi_bus_find_device_by_name(const char *name)
+{
+	return bus_find_device_by_name(&acpi_bus_type, NULL, name);
+}
+EXPORT_SYMBOL_GPL(acpi_bus_find_device_by_name);
+
 struct acpi_dev_walk_context {
 	int (*fn)(struct acpi_device *, void *);
 	void *data;
diff --git a/include/linux/acpi.h b/include/linux/acpi.h
index 67effb91fa98373d7bf19be5ae3d8baa9328d6e1..10d6c6c11bdffcad14100601e104520366dfc30b 100644
--- a/include/linux/acpi.h
+++ b/include/linux/acpi.h
@@ -798,6 +798,8 @@ int acpi_get_local_u64_address(acpi_handle handle, u64 *addr);
 int acpi_get_local_address(acpi_handle handle, u32 *addr);
 const char *acpi_get_subsystem_id(acpi_handle handle);
 
+struct device *acpi_bus_find_device_by_name(const char *name);
+
 #ifdef CONFIG_ACPI_MRRM
 int acpi_mrrm_max_mem_region(void);
 #endif
@@ -1106,6 +1108,11 @@ static inline const char *acpi_get_subsystem_id(acpi_handle handle)
 	return ERR_PTR(-ENODEV);
 }
 
+static inline struct device *acpi_bus_find_device_by_name(const char *name)
+{
+	return NULL;
+}
+
 static inline int acpi_register_wakeup_handler(int wake_irq,
 	bool (*wakeup)(void *context), void *context)
 {

-- 
2.47.3

