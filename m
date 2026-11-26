Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795685808;
	b=vlQbGerymbyf5xZh5+8QS7lFz3ijdAA/vqqxbtEm/JMF5Ii7Q8tjO5HJTb6wHS/fS3ID
	 Wgyi/sfj6/J9FzzIuWHEX96P4Cslw5jbA90ogQBGTl+5wa5a1zNq1GNXgNg+6q6LRXKr2
	 ELjJjwPWbgF4DkdWLRWuAoWqRi0JIbmZpLOuA6TLRSsRl762oV8cs6MnrnzzzUG67TOQk
	 jKd89TVB7bHSFtd+ywEl6AmLu7QV8sqTwoOVx1ImvGZwy1otrhsqHkNZvdKqY49RU5YD2
	 QzPrkI52dGbmt9fedQxU90+zJwn4pAcHyy+vavaj7PU/esNVlp0t/xwNsXNPbDWlWLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795685808;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=SCNpw1s464Tzj5KlGBOIPi2TTigUkXEY2fLFA/8KRV0=;
	b=WxnG27Qf5PzsHgk9kj+nBBvCsbJ1SN+jUmKobizJk8CyIrp7Yd9v3K+0cPH/FjUWE5yF
	 WtfWrduC08dk3sSJRtheCnv2DLsmWujfatV0ttVpbR55MHWcHNIva7Az0PgIl8WCavIqE
	 k2KywM4kY5MWPihgxE5HUbMLFrmkJRjNM64KDlRKdClZ9Lc2YLTyoiCcyOfqqOm3aTIVX
	 HBT6+gVOOSjYrgRsVzWmQggJRqdLp+dW0I+iYVTBwa0MI/+jFaFI9Z9x6UghwXoHRiUtT
	 DCe2aK0P3emEnXWK0vsJj4VhBxsMqN02bis/nmOQk7rFxXYpbvq/NHsHfdYVqWJlS0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=h+cGlcuM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TiG4wk4Y;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CBD960A263C
	for <driver-core@lists.linux.dev>; Thu, 26 Nov 2026 09:36:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CBD960A263C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=h+cGlcuM;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TiG4wk4Y
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7B8aG919520
	for <driver-core@lists.linux.dev>; Thu, 26 Nov 2026 09:36:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SCNpw1s464Tzj5KlGBOIPi2TTigUkXEY2fLFA/8KRV0=; b=h+cGlcuMzvNibvmv
	CuHu4uSUESnjyED14sZPNgcLzWrSwYbOeaRBTH2HxXQ7ThH5SSfjUl3NHMt1THy4
	AakRTV6o/oXRwMHZo6UoqrH7lo9aoNCPQKgXieTCjhEQm048VEov1WJ1mkd8juAx
	IvVYoQrYXKatMHvWHYyGipGhl/qxAbziRaQwuTD/0zLsyxX2PkZ9whnbsIMttkxJ
	ZkwqMfHp59xDiVcPYGO6EmJVGTjJihYsiTfXO3gb7ZUq8B4WgpBIbclGcAIKzRN5
	4mq1Bre+aRNASOUKwM9OFGHDma4dz8vcMy5qqo3qrDtNv513uSvBU+YGkvn7fd7s
	8vVwcw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j662y2f1t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Thu, 26 Nov 2026 09:36:46 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9495af07676so1037687585a.2
        for <driver-core@lists.linux.dev>; Thu, 26 Nov 2026 01:36:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795685806; x=1796290606; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SCNpw1s464Tzj5KlGBOIPi2TTigUkXEY2fLFA/8KRV0=;
        b=TiG4wk4YkmhEjhFVLB7wDVmeMnt+UMwxL09dBdfmhT5JJJr8XX5fjwTpEMnxnUjojH
         iAVO6O2m/KTORNnYc7nQQWOUeiLr29h3D3exhylsNDr3/0j78f+3oaq6uU1alOGPN5pl
         zqTDShMm0yqit7vaMxt6MKbdIpIaajcsal/dpahxCBGq/lawdZ3y/E8jX9H79En20wYF
         rCFRO+BoSnJjFvf3pS9o2Zl74qGOEsk+aVJ+fB/FvVnMNDUvZpi5psKpiF1O6akLly6u
         TZjO/py8FjwhzHBzGoJ1av9XJkhDY07c2FwvG/IcQc16msH7XDccNOWByFWOYaFMhP2e
         WhfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795685806; x=1796290606;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SCNpw1s464Tzj5KlGBOIPi2TTigUkXEY2fLFA/8KRV0=;
        b=RogHDqnTZNBPfU8bZYxCpGqsG+SbhQngypvOLDTJi9fonPHJMJhqrpxHl/n50ZIGLp
         i3dlFQ6rD2p9SSVGBKmPt6rr+fuOg7kZ8IPChUlu4OCREl9uHi+xw114eYnp0ooSxQPr
         aJjxnox7h3wDFgkHkw44WHUEYZzxl0j7bl+hKv49byZkTsFeRLAoWBigKyHU51YCbqea
         Pz4vuwEt2K0CRot7em2kMTO0o4wepVOs+QBkCMFOMzwMS2Pui+pPUO0tWU5Pzcyi5X2B
         VhYjYIpRtdiuoPSfZPzc/at/CyQANtyVlAZ5YuLqkTRQS0eRr4eBWFYQSpOS9AhdH6zE
         QYMw==
X-Forwarded-Encrypted: i=1; AL+hErGnCDvxiwBlYDDb6LL94S53XRLYI9vYJB3Kd0xRv8Ix1V1OjyudvlW3eWXKB5RuRUD2h8WKhtfNfAIMiw==@lists.linux.dev
X-Gm-Message-State: APuU4Z8IMADdiaXhkVmJKKDhvakVDfEZ4sth7zdF9RQb/E+NqmPT9ZXO
	ttqJfhruXqKYBgJL0w7UiCPxKGenbubcKsxbhwYzy0nFjh15kt74B4+3iRP5kOOSwRE2gTaWdtE
	IwzIzkcBUA5b7rnyYtPh/lfNBNOwihRiQIo4HpvVNAkvDKJtDcHxhfYtaM/OrsFA1bQ==
X-Gm-Gg: AZFdTZcBT+MYJtBUHiR/3I66z9W6G/0/O3v3FhToRyu2LsO6AFsDcqygmizT83s8hGm
	+h2zfAjl1qKPm4oYPXXXj7cR9wAL0XMWc9prbO5nurPxGaRjtNq6DRRD/gWs21MWY84JTSM042i
	+Ntca8IU8E3lrXb18hfjHScrrq9V4CQMOLI4eik9DJyZfAZ4YCYnKkJk1zOFUPJGHIbTCc3vKN9
	5LnKYZnu39UouxCZvJR6MjQ4XBRjpqXDBN+9Mb2LX3sI6FU8zwoL6v0Az8zIseCzbbfcjUFOkEm
	q0l2Efd1rnX6dRgYPAWlyPFo2B4I6UhXvIby7ICoX0j/uhaLZLgkKRQJN8LjbGVScpc0edSIL69
	51pekI/ufhHJkvqxu0ySsQLq8b3qXg42afPZUZGLUVkiwWY2TNOVPs1Q/wou7jyvTcTx8AUEX71
	Yhvg==
X-Received: by 2002:a05:620a:8089:b0:93f:2bca:2cd8 with SMTP id af79cd13be357-949ba9e958amr3401669385a.57.1795685805701;
        Thu, 26 Nov 2026 01:36:45 -0800 (PST)
X-Received: by 2002:a05:620a:8089:b0:93f:2bca:2cd8 with SMTP id af79cd13be357-949ba9e958amr3401665385a.57.1795685805201;
        Thu, 26 Nov 2026 01:36:45 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8960068fsm227079335e9.4.2026.11.26.01.36.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:36:44 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 10:36:26 +0100
Subject: [PATCH v4 09/10] gpio: shared: remove unused field from struct
 gpio_shared_entry
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
Message-Id: <20261126-fwnode-for-each-prop-v4-9-d4b370ecfd52@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1175;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Gyj/ChOHQ3GV+pAQrZI7Aj+LCmcubDcyu6k27uxVWmY=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrB/2VBGjpdW0iPoYV/IBOQcKz/c99bTgMGWmFJ
 hPaWhBDSTmJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawf9lQAKCRAFnS7L/zaE
 w2dLD/46O+avWuwJk9Y4HHE4uUZvv4Qhzk8ofwZbheAvceHO9A5+8+hnMqT1GPcjC1Ghe102OWL
 V6NrN8dfJ2N0wHI2zFaidHgJyPqMmuAMYPU6HpmXKugkvfYQGzOINhEwhrraBKJ2q8FJiCUpnaO
 xG9OsMATlw6jAkNHEWsMQdy8l2GP2rOcF5JrH6pKG3qgQwwv6yvU6cqGSnZqQdSjMRRRLZdaE+D
 e4zHr1OIn7dlMfISNCDVdTvFcvKfid89g3gKEuWf5SSGHai7RN3O2U/5LdD0cV+bsJK+lYTVj/u
 D/KUol5Ewc2vjstIWNY5PXxy+9d9vKfh3GVoCLpY5/Jr8QYZhq4siS7vjntc2GiJqX/S7izKu/b
 A4pVua45kTJPSWaXgUWmAziQRD9/pdOJ5MovSbbEKffL7+ECKyjLkyG0rPOQvMnLIaFpgzZlVnc
 AwP2Y4ssqWvQckzOGNuH5AK6LNzfnxI/NRN21fClpVInQHCd0q7rlsrOhCs1I+rdJ7N2PbsjD/P
 Z74VTIWGnZDHQFuJTEw1FzCNfHSu2kEHZLXty7vFOfxFHhtR+o5hBJv4hNYTJ+D9i1YDqCtesR7
 5a7mgaefuiaasCNWIZSdTgy/wWJbyeEMJ36vwc9q0HqEQYcuFbw1lXeNJ7608GR4+5gdwzdSf5l
 n08uKr14tH+EAdQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzNyBTYWx0ZWRfX4HgILQtfDL5L
 hR2r0SMmsn9BajrbkzRwEEn/O0D5CE6ee04B/AtBgYAHJAw0E7YOUA+zAvloLQQT6q5GbZM2FR+
 7r4r2mc/+iOy0RFd2p9TGWfC1WQ8Ui6aUsw2SEsgbC6M7KTTkobrXTDlv/Vz/si3AZNxd1ttCA7
 SLXFlnaIYp/mdMwlHeiSHFBnYONA9OoeYlzNQYSUejadqroSsy0koxmlu1spJ68B2Na4918vFEZ
 LS5XUpcW3vIYsNMgklNcq5PVFPnLFqurrNOldq7kzM8lA5Wzdrg+l3TrY/AGkQ3Da37H2zi0TTS
 jbv25YNlb9ohZzDHR++tIvZvcFMktc0q5ftcVcr4iT+4Kc5FdImVDdVxFGTWjQilwORunB5ugLd
 dGw4I3vqAc1O8Iq4n3pnsIUiv7NLX1juvxiRTCu/fH1vIxHgDJQ0fBQUMG1o+34z6rRYTtk5V3H
 9x9OQnyZqex6LppjnMQ==
X-Proofpoint-GUID: _uRQjLINIEcFIaaqs-zKmWMGDoHwyWZW
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzNyBTYWx0ZWRfX2UVXtzJ/lZrx
 7Xp9qT2W14CYECYP1DErYoc2+3pXH7M956unZG7sg8JF8U9344gkr8mgvAsLNEXmAy9DGRSqvCY
 g9W4ORp9fomc3AuP+lYHaqhrgGeHZ/o=
X-Proofpoint-ORIG-GUID: _uRQjLINIEcFIaaqs-zKmWMGDoHwyWZW
X-Authority-Analysis: v=2.4 cv=W/KtxhWk c=1 sm=1 tr=0 ts=6b07fdae cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=QyXUC8HyAAAA:8
 a=EUspDBNiAAAA:8 a=AZKRSRgWbs_cT9JdyuIA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260037

The index field in struct gpio_shared_entry is an unused leftover.
Remove it.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib-shared.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
index 7f8b31ce4b9ecdff8cb8e34bdd546f44a21d9ed9..610d4b35d37c512eba6e8feab58dca2d9da0a152 100644
--- a/drivers/gpio/gpiolib-shared.c
+++ b/drivers/gpio/gpiolib-shared.c
@@ -50,8 +50,6 @@ struct gpio_shared_entry {
 	struct fwnode_handle *fwnode;
 	/* Hardware offset of the GPIO within its chip. */
 	unsigned int offset;
-	/* Index in the property value array. */
-	size_t index;
 	/* Synchronizes the modification of shared_desc and offset. */
 	struct mutex lock;
 	struct gpio_shared_desc *shared_desc;
@@ -228,7 +226,6 @@ static int gpio_shared_of_traverse(struct device_node *curr)
 
 				entry->fwnode = fwnode_handle_get(fwnode);
 				entry->offset = offset;
-				entry->index = count;
 				INIT_LIST_HEAD(&entry->refs);
 				mutex_init(&entry->lock);
 

-- 
2.47.3

