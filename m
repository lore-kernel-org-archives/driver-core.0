Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795178816;
	b=N0hkFbP7I44eKNjE655Kw8poA2J0WYfiftVQ39FgNVRRQvUwCUwEi1/DZFL1TpU21ZxY
	 VsuoOg5gY782BNgS0vu2IjYIaF/vVLtEVTOt+2jdwB+n0rSPoW/pEaZbKn5SXR/7o8m0c
	 PP4eFuknCEtJ+086o3fVVvmFGos7zjyiuxk0qANa7N+PRUz0PSmGQ/x2coij5OqtwlgJR
	 fYZiIqoEsJUGcHcknX/CIzlvb26Y2yoKB2nOM1FW0U/Q/kX7ThLqev5SIzwofC61TIe0q
	 B5LxJg7D565qBBjfBgDoylQe1UGW0qRk5bAvrtTYu7hWYse1mnG1HByogMSbZjXYjKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795178816;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=05HkMf4ygIqtlQzRN7ZbpqVF0GJOazAPdTl6j41Coks=;
	b=pp1bE2ft/bk3uJHDe/+/U1ppMyYaYmmiHjwUMTk2fGvd0WtZ8yvXq2GEterRJbqnFzAW
	 evpyx6RDHtMDP+4DUyeD+EPobFDbcA2JDWCLpamxf5Z1/tzpeh1Bsy0HphaI2m6sCqUpL
	 8EEchy4f4jmUqCCC2IW564C9k/JStoyHT1QIME7k8LYan9gdmJ6PwEGMYsjvu+ZvrqmMY
	 rYKn8BErlX+LshKzFuNuFfj4dP2cWfYRd8l6wWre3aH/JMP1LHB1fHqCxHxGe1YItmpjN
	 KaXdnEnyr3qduJVv0Njsc0DL874BjkwTLRDsRwyucqDQBY/dTdZpo1FnJ+MnPfzek6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=R0QGU5oF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PHXMaCOJ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 181C0606A336
	for <driver-core@lists.linux.dev>; Fri, 20 Nov 2026 12:46:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 181C0606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=R0QGU5oF;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PHXMaCOJ
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAkg5Y3107621
	for <driver-core@lists.linux.dev>; Fri, 20 Nov 2026 12:46:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	05HkMf4ygIqtlQzRN7ZbpqVF0GJOazAPdTl6j41Coks=; b=R0QGU5oFbZc24jaz
	K8JeAKp+DafQwKeQBoxLJHy9NZenThm3sYRNunrFmfHhNflJkG57Pc06Y0tXT3KB
	SqZxq+4s300d9D/djek7paTjIddyIBOvH+j4ldJnws3F0Dk0fC2OTq2fJ3CHsSHH
	BS2PivKuvPe/co8DBU0MghGe5/XjX6WZ0YFBb15T2mw2TWvuFKIsRZDZRYSMG8TN
	Q1tcme8/mDF6IGuHndSuVJaleqI2nkQ0ZWOmi4EzT9KR6kQcogvd9WhIS3t/KNWC
	YT7U6d4J6Aa6JrrGb1U/Pr4Hgk/duzmLevKcsBkat4fZdSNAoaYDya0g5kKZIXtn
	iXQTMw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j27au3rag-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Fri, 20 Nov 2026 12:46:54 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-947a607ec40so95162785a.3
        for <driver-core@lists.linux.dev>; Fri, 20 Nov 2026 04:46:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795178814; x=1795783614; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=05HkMf4ygIqtlQzRN7ZbpqVF0GJOazAPdTl6j41Coks=;
        b=PHXMaCOJ6o1tAd+bs8191/o8y8PomrbNzm36UlFEvkdTCxWi3DvxfSkmfKemzm0qSf
         02RDTfcvS7Aaitq5yHWvnWayqUlf+Lu+pvvPLnwDwP6PK6tRGZRhrqT+cbHbXSXWuOLp
         jzv9dMF4gC+CJ0cp7uhLFF8GEUXezqayrtujknCNK97XaPBtHm7k1MQcAe6Tx8wOksif
         ygFBgX67kgqo2gXwlJkoVen4EA/Guh+B3Yn531J6sN6yJbmzSyFzKbheZAtQzSdzl1PV
         EoH8/k4SMV5e6SnKgxkIu5Gy5rSk80kIBNc7U/npFRMvfOWSjzlQPKmWfE6ipjIb8wJ5
         pUTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795178814; x=1795783614;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=05HkMf4ygIqtlQzRN7ZbpqVF0GJOazAPdTl6j41Coks=;
        b=F2BflYh9UbT+3MvcTntpFXJShd1Q37SVT5frO/83k2ybdeQW+Tx35mm7nOU6OXi7gM
         BMtCw0jiQFszRZ/EicxQxNh+aJ5JybrN5OPMq0RP7fNuSArfGiBvME0pLB8dUBVcvsUO
         LhjadK9SERlhXQ7Q6vMe4xNL+aeEZHf7V1VT/LA/BxTcPvlNOD6Th27nmdXiJ9kiXVC/
         hxg23GJjl9oznjH5GI3izAf45pMACTVYLvuzgoDkFiv6TFY+mjPa+1VnKCPtI8Fp3IN4
         wIKEoacydfDqAItpWDQjzLRENfFswOM1AizWt61Bun86tPs1sEm7htls5JngC3tzPTQL
         612Q==
X-Forwarded-Encrypted: i=1; AL+hErF1bDl+HNKengr2pt+VptyV7yCto18s3WmkmCM5rcn6uVKQjbCAgx9JBdAkiZLU4zD/mQMnmTlQ0KgAAg==@lists.linux.dev
X-Gm-Message-State: APuU4Z+Jk7y8XpT1qvjD2j/fAibQUbpKW+pRhNSCw7tLKr/6kbj0i/X1
	MJCbp5Z0HmfXfmW27nRfK2sjE/mmzoPwzxCHr5zR8nBk7Uax5q4Bbr0r9ZSZdzGS4olSBKItdTE
	Tccm9MaTVL9rkgFHYlaVN7NA9zSqz1JpT+H2myzisI47o3ut5omGja3xKiOkuIvbJlw==
X-Gm-Gg: AYBFou14xj2Q1wC8nPKAa/dQR2OlwfEghZhdqRzQqmf/HTmmqVQcVpZaV1kMHEt0SoX
	hJavyShkyhwtCLLVjd1kGqfC5kR2K9vbfCekTOtpfrFxjt5WIAphGZPHG9yul5blHa46RBTCaMw
	8Gr919dQD/AKrT1S+1jIFAT3e4i7VjINPjLK2vi/FGPyvFter2U4LA38DAykQsurzbqTzyZXPEH
	a6gGc1KbKgVk5FFkvul0VLMHsLSS91a+X3YqtWWXgsGbz1Ph4LMObt5fe2+RvtBdSVptCkRpiO1
	+RKiup0tuTf3k/N+U5OrHjs59lZlGJV/7+EvF6NNdMfnWcm3mrO593OqG7l2i+diagSZghE2EgE
	dUyhIYwDQGW/WrHrHm0VHUOyHGkmFcgGACRIdsyr7DW09cyOEIFEIMofyRqcSK2mdLg3UpZFBG5
	0=
X-Received: by 2002:a05:620a:4056:b0:949:7893:397d with SMTP id af79cd13be357-949ba9b8ccdmr519731885a.23.1795178814014;
        Fri, 20 Nov 2026 04:46:54 -0800 (PST)
X-Received: by 2002:a05:620a:4056:b0:949:7893:397d with SMTP id af79cd13be357-949ba9b8ccdmr519726085a.23.1795178813505;
        Fri, 20 Nov 2026 04:46:53 -0800 (PST)
Received: from brgl-qcom.local ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884ab091sm119248995e9.11.2026.11.20.04.46.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 04:46:52 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 13:46:38 +0100
Subject: [PATCH v3 01/10] lib: string_helpers: export and rename struct
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
Message-Id: <20261120-fwnode-for-each-prop-v3-1-808e304dc73e@oss.qualcomm.com>
References: <20261120-fwnode-for-each-prop-v3-0-808e304dc73e@oss.qualcomm.com>
In-Reply-To: <20261120-fwnode-for-each-prop-v3-0-808e304dc73e@oss.qualcomm.com>
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
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrAEE29BUzYu7qXthMo1ziHpRFzdZUEh3WqC84F
 OGuKrX0zbyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawBBNgAKCRAFnS7L/zaE
 w34sD/9INMXQs1L2Mvsqvlku0UNIaFhS95oY+fgGh50hV8uPpZqYJ9NtZmpgskw0vpYis2Ro36u
 cztRSspCvn/1Jy3tnFXLHIbVPKIidV7uL/eo+pgDu2WooSCrpLxyVtDrCNZnyQY4rzglxSzgFmV
 20FtfdT647KzE+j63r3q2iadFYnTGomwGclZCfdpr3nExBli6ufhptbHBx2Q47EUvuQUGzvAV7k
 vyt4OFpD9PqxpFfoyXpBqT1Pgs9d8guOTsWXkbluTz0VOLA0sNtoMilnS0MvpxAe5azhLzRFSS7
 qrgJL5Vki0qb8jbx6YgCBxzPIf7Kmu6tQtg2hfjYCFsPj32pKplN7th3AJk8sj9qpLQIjomLZvw
 ZpTl8iJgw2H+oh6esb977jX6S5IxI7IiNqfg2zbHb308qdGmD7tw8z15idvvEDvyKO75tJHJ/79
 wkxPro8xFGpTImnweShdNOz9gkOVNue3adn56GhyY1nrWX3KyRYSzUskSGUEkAuFxpZkOAcMYWe
 SDGKXMcobp9/+IK83ILgxdB8ShLGcthKK1mx4mcAtYwMmbI3VBlmq2qBPyDJ8N6EyXkSnaNYB0i
 po/BVd4HrzPDYz4cPMbC/f4Ix9nHwFiCRJAYTkd89W28TI1EEtyp6D2bWlP3PDqIyCppC7jgWh/
 mWyRS+q1a+CyOKg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1MCBTYWx0ZWRfXybN/Ki0bL+rg
 BSGw+afd5azUYiUpPbY9HoU6wiow0iC19+SqxDhHmvPWs7PIQkTxjyhJOwpGT6aYOfH9+QiTcY/
 14NxPoxO+rcONGIFP613b7C7DpROS3gBu+VVAV+fkbsnyNSadTLDcA5VQj7QjQBqFAqAfMwRCsc
 ip2HIQ0srJvHv46uuP5MmVWWcNCze2a5NOpFzn+RcgpfOUOZn1XJ8MtksMtzR3NAkf91xUsLwWz
 +1QhAIEq5X804Jfg4KtQPkQR0kFN7C5xpJdSfLKVtRPR2uYCcHvpF9K1wGP4XWgxuWc9xLfHAmE
 G4VRZPxzudjZmU0RvaeEYdPqwWdMnuRyV8Snykqv75WDqNNdObNh6qYSzGLN37TeiTEORWesdUQ
 hPeKBM3UA5h8jFagy1gT2oH7+NQt7Es0KCSigQrQsz+8+rchGQlwD/tCiCOnOBAc+oAN1ahJUHN
 cpRezwZO5m/OIj6zjrg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1MCBTYWx0ZWRfXwGyFsbGq/eSa
 VNNN5Yii6hGFcllN8fcNq9/GUDDRgiGGxxW3Korq1/36Qhqv349jXLXvhKdJMMIM2zPPn+LSH3I
 aeLdjiLAWQ5wC78jL5Go2slAUqefpmE=
X-Proofpoint-ORIG-GUID: Fyc9JzC6sOBJlPz_i9jag_fjB08f36ii
X-Proofpoint-GUID: Fyc9JzC6sOBJlPz_i9jag_fjB08f36ii
X-Authority-Analysis: v=2.4 cv=KuHYSmWN c=1 sm=1 tr=0 ts=6b00413e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=NBg0Ud2t-6tr7aH_vnkA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200050

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

