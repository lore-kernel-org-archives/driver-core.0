Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F58C237180
	for <driver-core@lists.linux.dev>; Mon, 23 Feb 2026 13:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771853876; cv=none; b=XIKYR+GvZpYJtmeCfdh0jyu3S0FmwDmLqPEh4bhzHieqgHIk+JJtDUH9FeP/FaPh1gAoEpSwTWrljskqDRe7g+NaKegeBryhBHMTerAYzQneYUiol10S8s16vtYsRwQYVaYSszKNCVt/MVUp8SI1egGz9o38PflNYbF/AEUyA+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771853876; c=relaxed/simple;
	bh=kiNnpMfASMUUyUM3BexU/p37quB5SdiUkVxgKJCVWKo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VClkH7N+rptwO9wFVRDj8SiGWP+t5m9Dxwg3/eD3VvbIf+/ZVObcDVGxuH8GUn31sG1/R5NyuH19EfvVPuH0DY1agZzQ7jRnVYtOu81SYk2mg0MGwPNWhboPSwRyCJBhEF4bX+zvLeNJBqtEmCbSQPgXMZvgFWqHPe2kBdZ8t5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dYXQH0Mq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Lo1nR3Rf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dYXQH0Mq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Lo1nR3Rf"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61N9htLH1778082
	for <driver-core@lists.linux.dev>; Mon, 23 Feb 2026 13:37:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iba8wNAiFrItxk0+Sa+CV0EOAdkMUhOqnjgeIwomRIo=; b=dYXQH0MqntZSpIKl
	cur+MWYG1rIaZsKmNba1FmLfUAKXHNpGFVT+7SP8N7Tr5AlCyvB36GtjALEOK0Od
	ckgnz5RR9O4aFrgY9dG9vbkCWvnORORIkbDI6rQMYjlkJlXEGUAJgrR6C05z+OKI
	s2pN+SWQiFcc6QTY62km53aJJCbrN8W2V/UX3nX7OX+tZTf9xjin8hyGcqx7+M1e
	V9q8/0rgb0cWFYQ9bGW5KfHHCNrbUZHa9sNG92N0hLnZhjUtXpMiJmJdCYIsS/PV
	TbPUsydiR94kgac/pi380Uqn5Dnc2ixobvxW9uOduwCGdexZA+M9ply2XCIV42sJ
	toiboA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5u9vuv3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Mon, 23 Feb 2026 13:37:52 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb403842b6so4700842785a.1
        for <driver-core@lists.linux.dev>; Mon, 23 Feb 2026 05:37:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771853871; x=1772458671; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iba8wNAiFrItxk0+Sa+CV0EOAdkMUhOqnjgeIwomRIo=;
        b=Lo1nR3RfiyY9cOFrsky7qs1VHvpV5YEzNFCY34Yw5qTvZxasGv0YCgdMkVjufpNc7q
         v3q66Yz+kmDk+gF/KMy3ohFk5kLgB+VMbaFyexr+h7ayWsXdm6NaWQ6FanpYSKrjV9fT
         tl13K49btXWNWwHNxIUQpmLWr5GU2JiMScmCHl9i3UnMvumZS63i8UNU7fNH+nUFlHvO
         v2wDni4iiQ9BfLvUXNPGfOMg/xLdubpaBHF54mA9y1PzxE6Xl3qqSNaXhl9ksZzZBvpK
         tNo0ONUTg0Hbxhh2QtksUeHBOeShWaj6dKeXuaX7FE5m5AFhgLJnVTd6tt5FacWOZZoy
         dsBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771853871; x=1772458671;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iba8wNAiFrItxk0+Sa+CV0EOAdkMUhOqnjgeIwomRIo=;
        b=fQ1FNFXmwPyfg6olmCIiaaCGPno6JvvP/QKco4/RqbgHcozOZ6Efa7APskQ6oLUBLT
         LFcNKP7bdmhxRJmQi36KVy6pNxBDI97AjBTRsGIXKSWU5vLyaDHeNZ/7SJsHwPzMOo8g
         9WMFiQzyI3HWn4IyOplASIIBVmt3R7TlmJhLI1qf4yQ5GbhT06BkPPAmDv28br5i5qmv
         wgAV0iLmTQMhUN+h/fRd9mvOl3GUAxONN0g35swEIzCv13JG69E37e/tKzK37ew6Y1Rs
         bDr7uU/yPjhFuedHtyb4w1I2YmdxZWpI8I6XyaHo7IH9rnzcKSh9qdve0dZbdRCzXhEc
         ZLZA==
X-Forwarded-Encrypted: i=1; AJvYcCUYHvBImX1K5lxWJU3dRYpDRzjkmkrZAymdntO05XLXYjzOdv54r6AbFhPah1KVXRFHX4vULrkCW0u8Fw==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywbuup42HWt4IR5L5vugtXEGDA/7dMHDHmPCweD0uVZzYUfcq1t
	/scIHpnn5k5P6O9uCR20xHU06Vg6RMMdFKstAC4Hw1CB59lmgH2309IXfCaS/D6/PxqRd3GB+NF
	R8PLEyibmyB2mVPZ+ieQGiSFyBx7+0P5wCXoBi4QZ7wrxvCcsbJ5lTQtd09O/eZnw1g==
X-Gm-Gg: AZuq6aLAM/l/na2nxL31PU7yBLx//WcTQ4dnWHrLfxCRc5QJCNI1lf+MaIqQxHMmh4o
	1JrnbBUSef3tbxnWsSZG0cnddiWr0Eez9TnGr+C4B1vGegfBuKRMr1GLuSeEk7yVfaFmdLUhHJC
	ZQe/GueJOiwyehwJ3Q2lMVRBGgoEYJ6tUHtmbEghfKxVwO0ioCeHiBwOk7AW+QLJwAbQlXB31hE
	o2lH4AOW7Y8Uwv+8jqmajbzyonybQW/djNNp6IJ+mWtq24yYNCn+BE4yFYUZwJGl1cIEedJUUWc
	bFYIpy4WSOf7MXIIqwNJ3zhbomKtGd0+iE0Qkn5AW66gRRkmZy3V6YUT97BGVK6aZK9sepA3hBC
	JCtlp6rV/zGYPgXbNV8Bm/MrUdYy59RSck66wL1zEzT2wvwQF8/4=
X-Received: by 2002:a05:620a:4052:b0:8c9:ea6f:6a4a with SMTP id af79cd13be357-8cb8ca92f3amr1068242685a.78.1771853871512;
        Mon, 23 Feb 2026 05:37:51 -0800 (PST)
X-Received: by 2002:a05:620a:4052:b0:8c9:ea6f:6a4a with SMTP id af79cd13be357-8cb8ca92f3amr1068238385a.78.1771853870980;
        Mon, 23 Feb 2026 05:37:50 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:3fa4:55d7:7aa4:50d6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a42ea5ccsm89398715e9.16.2026.02.23.05.37.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 05:37:50 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 14:37:19 +0100
Subject: [PATCH v2 4/9] base: soc: rename and export
 soc_device_get_machine()
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-soc-of-root-v2-4-b45da45903c8@oss.qualcomm.com>
References: <20260223-soc-of-root-v2-0-b45da45903c8@oss.qualcomm.com>
In-Reply-To: <20260223-soc-of-root-v2-0-b45da45903c8@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>, Frank Li <Frank.Li@nxp.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
        linux-sunxi@lists.linux.dev, driver-core@lists.linux.dev,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2484;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=kiNnpMfASMUUyUM3BexU/p37quB5SdiUkVxgKJCVWKo=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpnFgdJ4S3kKQy7E5gZ1HH0U5SQZilqtbHrWuRg
 vsXfy1WCm2JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZxYHQAKCRAFnS7L/zaE
 w+ffD/9rAOyhycwaiVuwUk5IsBC6AoWuSyHbtclUsR021hX341sTNrodmTF9hBEyCYtfeoID3s6
 6v54GhA+fRlXWOiMcydGgtSfnh1/l9JMceBWhF24bHQuSAibluRfYEHlf3q7KsT5Hf7u/YfHdwv
 0S7/gjaeJS30/KeoKhxy+4i3Zl33BKt/7NkLDJK4gyrzhOJIecBLTZZbC58VhpbOwBq1uchfsSI
 eM745iLv/Vlg99B9GuBna643AcG2mK0QBRJVBqm0q3ynRf2uJ2T4i6COg66w12blMZcHrZK28k8
 SeC/oWmP91fpkpb0irJ/icN6A6vIIFFenIGT85YwHaTwE3+gvxjb31t1Y5KompcEwLIPOAfn/TL
 dWoMEdcE8krPx2hBK8ylSyyT9+SD1tMG85TZ4OKKbSixYU5XP/Bj6mVeGH9+9pKUqXy3PSuU/An
 V1NP8SeznajicCUQ1QJF93oKppmUIm1V5gQQKKxi1I+gWRG5nG5W0/uTz33jh3tvhXxt14vem2o
 0Y3AZokJjVKI8Il/350KT4+2vWorZeZjVtaku4rZgEEcoxjQ4q8YP+ic+Pt5ExHSIkYiEzhC5jv
 r0utAOUE+xo8SMXpcDj7WmsGu74rh8oim9GPqphG9oWx8OlsUhJ5jecRvSRHBK043p5Arv3iWI2
 hnk/0nakVnNjHYw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDExNyBTYWx0ZWRfX/NJx1+Ztm/CB
 6cHnwoViVStN2b09UPymPG8q2lPtTctEl3UoXjL0VSi37UrJIsze7IHjcUs5V9qqQN+ko8AcdJ9
 DMB8yhQfpW/cqd8tkn7jfDrOGspb2diYZa/geQsznfeu4BTLYtHX5Oyn8Sjgv10WSi8swip/LAV
 nm1mwBsOBmRngVgu9V7MA4/BQRM+nBWWqmVf2UOG4IeRkss9w6VUQBwBLijJEs/yHevzJr5u7Du
 7i/rJVmLO+HcAHfpx2R69jEuGG0FGW0SEhPVFQvzJkMrpJ9ZsCmXac972G8cmk+WmpsmCaLin6S
 zgJtgt6s5cJVozZ9KgTlz/4Y/+vvmo/MRaHH0546jIsIzRKJgHMaHXmrX4melMyAPpBortVV/GE
 y3oDYWv18utB+inPmAil8CshIW28Xexa8mAmXfz7jitEDFmUvVdhBGypnMEFBBGGIvKllJWJ0I0
 XGJZwdcuDRqEar9nQtQ==
X-Proofpoint-GUID: YTgqIC-lKqgEp4tgV7xJaVRFctdlgHMd
X-Proofpoint-ORIG-GUID: YTgqIC-lKqgEp4tgV7xJaVRFctdlgHMd
X-Authority-Analysis: v=2.4 cv=RpDI7SmK c=1 sm=1 tr=0 ts=699c5830 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=VU1FamAdWuTKyoDMntYA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_02,2026-02-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015
 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230117

Some SoC drivers reimplement the functionality of
soc_device_get_machine(). Make this function accessible through the
sys_soc.h header and rename it to a more descriptive name.

Reviewed-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/base/soc.c      | 13 +++++--------
 include/linux/sys_soc.h | 10 ++++++++++
 2 files changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/base/soc.c b/drivers/base/soc.c
index 48e2f0dbd330b8d402135ffa7308f454eb4ab7a5..65ce72d49230360c22a812cb9286e7fb4de0baf2 100644
--- a/drivers/base/soc.c
+++ b/drivers/base/soc.c
@@ -111,17 +111,14 @@ static void soc_release(struct device *dev)
 	kfree(soc_dev);
 }
 
-static void soc_device_get_machine(struct soc_device_attribute *soc_dev_attr)
+int soc_attr_read_machine(struct soc_device_attribute *soc_dev_attr)
 {
-	struct device_node *np;
-
 	if (soc_dev_attr->machine)
-		return;
+		return -EBUSY;
 
-	np = of_find_node_by_path("/");
-	of_property_read_string(np, "model", &soc_dev_attr->machine);
-	of_node_put(np);
+	return of_machine_read_model(&soc_dev_attr->machine);
 }
+EXPORT_SYMBOL_GPL(soc_attr_read_machine);
 
 static struct soc_device_attribute *early_soc_dev_attr;
 
@@ -131,7 +128,7 @@ struct soc_device *soc_device_register(struct soc_device_attribute *soc_dev_attr
 	const struct attribute_group **soc_attr_groups;
 	int ret;
 
-	soc_device_get_machine(soc_dev_attr);
+	soc_attr_read_machine(soc_dev_attr);
 
 	if (!soc_bus_registered) {
 		if (early_soc_dev_attr)
diff --git a/include/linux/sys_soc.h b/include/linux/sys_soc.h
index d9b3cf0f410c8cfb509a4c1a4d6c83fde6fe33c6..f19f5cec18e28461fef57f22702d2c44a41e4193 100644
--- a/include/linux/sys_soc.h
+++ b/include/linux/sys_soc.h
@@ -37,6 +37,16 @@ void soc_device_unregister(struct soc_device *soc_dev);
  */
 struct device *soc_device_to_device(struct soc_device *soc);
 
+/**
+ * soc_attr_read_machine - retrieve the machine model and store it in
+ *                         the soc_device_attribute structure
+ * @soc_dev_attr: SoC attribute structure to store the model in
+ *
+ * Returns:
+ * 0 on success, negative error number on failure.
+ */
+int soc_attr_read_machine(struct soc_device_attribute *soc_dev_attr);
+
 #ifdef CONFIG_SOC_BUS
 const struct soc_device_attribute *soc_device_match(
 	const struct soc_device_attribute *matches);

-- 
2.47.3

