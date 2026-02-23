Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55CD02046BA
	for <driver-core@lists.linux.dev>; Mon, 23 Feb 2026 13:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771853879; cv=none; b=o2cUPNBw8OnZE+EKxplz6FJScy5hQ/7zHIiEPSkhlrDAEvU67ls69TyWNZU9+e4hSCTwPSSwZe0pvDX3d0JE0xpGCtturRISALW3xJGigBFdPx4lXP4YtqW0h2kK1OHCRtaxbz+D+s5kZUefDhPCC3AGkYVEf4rD019iA2U6ya0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771853879; c=relaxed/simple;
	bh=Y6cLnzxLbcY4O1vy1l/Pb+kY447eHyffEqOzNMSh1VA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gNmuehVcvbxS6lrosMKdP85yLutp8Vf0f7uv+Nlt4Yac6tanPFrTBiSdLNzCTDGY6YeyVEUGsKvyVyUGjRWLQMAJ5ijpw5NXAIYrp/XqYidz1Cqm12yUwEW5cRXhSQNiTKgF5kSvUQ7fcZNgkjQWJWJFIQDNLuR0UShJHQ/T0xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Im1mI+xx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KWTGLBU+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Im1mI+xx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KWTGLBU+"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61N9htLJ1778082
	for <driver-core@lists.linux.dev>; Mon, 23 Feb 2026 13:37:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hX2z1Mn1lNB1TuzKA7m+Z2aNKcAg/qPq95Cp0Br+6Qw=; b=Im1mI+xxY5Dok5Lg
	jCoPoGNfoc3/riz6XIJOoozon7D78y3Q3OFgonQcOc52ns4mEYU7c43JhwfxyFt+
	LMAi5aU8XqKO9+oiUm7cHxj0z+9aqxpF8/SOHBrcmY3XH2SttIry5fxi4xT0eUKv
	yhoRZZ9an8P5paLgGSkYSZgsL5Z1/zVVvnh4UUBz4j2YNuFAUrGvs2JJqrnT/WmA
	U8JTC1G+3L8k9hUrOXgisG4JWGxBzSveSc+l4wtOvR5Fngui+ke5gAzpByutxc2q
	8Lo9DSuPx72pFAjcCWe8Q09WK4FO9o/9nkjHnFNmFpEWUaRxo/UNcxrVwEBAl4w1
	+ShE9Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5u9vuvt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Mon, 23 Feb 2026 13:37:57 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb3fae6f60so5524696585a.1
        for <driver-core@lists.linux.dev>; Mon, 23 Feb 2026 05:37:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771853876; x=1772458676; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hX2z1Mn1lNB1TuzKA7m+Z2aNKcAg/qPq95Cp0Br+6Qw=;
        b=KWTGLBU+y9wAtQXUWcbxTBoQi7sU6Eus6zMUgGI8proeKUG9g4MZKyytDhgt3AzmmV
         VY5JrwQr8gro8yuACOTrPBJ/DP788N5JakuENUXxZjPHbxbmVl9DLf7V5zpD4k3FdijL
         tZna+s76NGz8gkQlKCPbt7DNz3yTu46TJK9P00UIsKsKNFb2IlC62KojwwK1wNT5N6yT
         AF7tOSCAFJazwfmyuB+w73DCfLGp12TSLaMDfObQvQ3eBYhiLUdwhmTxO7dS+V0mjVCl
         g2X6p+YsYUiR3W3HRnGn/OZ34iD6tbOr3gaSRCYP2PV0VITqii0JNQDpBD8V8peY5Efp
         LOzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771853876; x=1772458676;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hX2z1Mn1lNB1TuzKA7m+Z2aNKcAg/qPq95Cp0Br+6Qw=;
        b=Xy/OP2+7TW9Pjt0JJfMjpu9VDz+4z5zmZA1FmP8yiFRt8XrMCNDRtZftnGT3hwBtQQ
         gjdeumQlkoxhL4fhhEuNK/Sll55P46hSWkEN8XgH5HD5o01sAByaBbsa8n9XqU2rd64P
         x7F0mEGITmbYmrkn6+ZCm3HajItehsrgVmMc4NoMQ5NTFpFQKnNsH2Cd6DRv/XqZ82Lv
         rSRVCw65CnO3UaVyB2GjKxqMyS0qjK3RTPDgMBogBXDZSWWF69FiQ1yug7rDnGZwQ54t
         Si727P0zTd3+4Ydu7K8TMaDY9XL00cPfGC65aQeUr02HWZtDPBhUYawkYJtbZqiLPO9L
         54TQ==
X-Forwarded-Encrypted: i=1; AJvYcCV7k47kRgm/OZQ5scILWgggRZfLvezNKbO979UyflK5w6bTLfwhdp0iEU0GFHo6CBM0sich9S9fipYNMg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz+cfrUsLrgTpEG+vDaCTW+TVYqxtGukY4B1xQhMyNg66QWhFTp
	eXUIeFMBRMX/KCyf9pNDTpRex9X9HMG+6DChec7tmKv8zRE2ztMFiBIn7qkKH05CWEBqwKvspBv
	0ZVmRktSYyUt6LEfQT8Al5cPaTcX4HQcedIJ7sPFNJyg2a8te66wfHZxJMbfJqZwMrA==
X-Gm-Gg: AZuq6aIqLp/A0reqO/trZa3Zyu6lVMimtEFrUo08nDI5USz4E1DwFPNLnxPkn4owNkR
	2QrYCWsbVnRLbife1ejv6kEF6FyVdjoyu6pJehWaIU9aYXDKeQDgHml5hsXirVEvkOrnbJz0NV+
	0qQZi5Uka5mK9fGx6UP/4P+/MyIQoIkeu7dyPGDvlKCEd6cZtpQ/69YQ0psQwA/sp+0qj2IYQ+m
	GW78O/gQMiFW6a6TWoO6DM9stnRWnsl8YivY/ia0nS/l9ENmggcVXCldrEpUugFeMF10IdRGc4z
	BXj3+FV7NtzHNf+aGYcEcXMyPkuE/QZFbPWzeWv7PE4LEqYEWHl9BlhQtmHErdLnggrqMFSpJxL
	kuoBRI4OSKCr/BQvp2YfzalKXRjBnf2RwxcFxdm3ASoL+R3IKp3Y=
X-Received: by 2002:a05:620a:4809:b0:8c7:e8c1:ea05 with SMTP id af79cd13be357-8cb7be3b578mr1561789985a.7.1771853876014;
        Mon, 23 Feb 2026 05:37:56 -0800 (PST)
X-Received: by 2002:a05:620a:4809:b0:8c7:e8c1:ea05 with SMTP id af79cd13be357-8cb7be3b578mr1561785285a.7.1771853875469;
        Mon, 23 Feb 2026 05:37:55 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:3fa4:55d7:7aa4:50d6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a42ea5ccsm89398715e9.16.2026.02.23.05.37.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 05:37:54 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 14:37:21 +0100
Subject: [PATCH v2 6/9] soc: imx8m: don't access of_root directly
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-soc-of-root-v2-6-b45da45903c8@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1810;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Y6cLnzxLbcY4O1vy1l/Pb+kY447eHyffEqOzNMSh1VA=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpnFgfyiEhvnOTuwabLoouq5gojp7xTfxsNoS9b
 r4S0IUnXVWJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZxYHwAKCRAFnS7L/zaE
 w/7zD/90hs0mBgYKZcCh91ZyjTCM43x7ieC4F8bbuC/Z9ltgbbCOKLPt8RJvDtLoPCNCggR4EIs
 UZBmQG7mBKXwLosmLYnPrDP9WfPHD5FclsLeqz8Rhgt7zH+dNSz+6xTtKUNIix6ApcaYzXhq/1P
 2zQdSCpdD1rFaU9VmyfHgIjYdNwBKyVd5Htftn6rRnB8FS6JEokeNC5zVnEnm5A7bS2ilkhnJqn
 cqu5BLRwPq6G4reXHnL8XidN1j++El+uHP67EnZKbGR7OOisUCDQhmWbi8lNS//6MzjGnYb9NLu
 wFrLKYN9Ssfw3wTW4VNqE96aYE55vjMaKUAbkb8Z6kc8fCaGe/TtD7kuYaq5OxCvAvFuXK0Veye
 YbqPztVg/oVDFAJ9cKhTjY/cudGxJOEQTv4a8rzf81gi6QqGNWMFVspOfQZT+P1JsszrMwRP38W
 FZdfsk17TXfvet18kfZTFUhwTNPrHDVdnAa48bc60X+dgcolYfTF0NzZIuQLUDk6a6k2wKl5iY7
 Xbq0cA4kvkV/YF1Lrld+ZFyLm3BdSH2DERrUJzHxU7i6chgTZ2JiAQ6bKxYbejIM+MSaJXSXTlF
 Tu+EZ10ygw4wuVz5pazqWqyZH9dzg02jF2eFjraffWWO0iMiaQdyaTXAVJTapE6rjmTGrOvy98k
 dGFX1GlgUYFZo3A==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDExNyBTYWx0ZWRfX5PnR1iwPgqTC
 pbIGlroBukV0EPvWnHeOU3A0/dRKWFFyRcqqSWaWjRenTFn5OoKZGWanNEpJvbwR90ZiNuDOHa5
 Qr1JiKRnEEsIKePliiw+aIu8yfnDzH/YTjA+qtqjxVVCL0RLNOzDtnYx4MM12TElwNrR5kV6T/4
 9rU6wTzvZKlEtClI7vHHcCMTg+8Fm8vpAlc23apLYsCtiVnAUDI8jl+vTjx7s4BOgDrKQ3udw2H
 28JAqbQ86XUXA6ELus+pIE74k/xWz2WxCPHljrYqgG04GT0D68ttF+Bg9lahDfFI+5tOD6PK11u
 971fLtNpegYWoHkOJwt5Ue6pfDy5vGnO7DFtCKTU5DcNOkVOw3jSCDEiHLMqTVH4QW/opwpHQ0s
 RLljMsIAMdKGJwejpg0oMn+GTHacofXyuYT4F48Y9rtzltQ/O7+eW/tVIaQV6TQvzalQXFNzD1V
 juR3geOxg/IuVtT+jlg==
X-Proofpoint-GUID: ZKLZkkxk-3OFUZp4Ud3vtYqjTf9Irf7E
X-Proofpoint-ORIG-GUID: ZKLZkkxk-3OFUZp4Ud3vtYqjTf9Irf7E
X-Authority-Analysis: v=2.4 cv=RpDI7SmK c=1 sm=1 tr=0 ts=699c5835 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=755HHWBoX-NvMu0yvfMA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_02,2026-02-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015
 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230117

Don't access of_root directly as it reduces the build test coverage for
this driver with COMPILE_TEST=y and OF=n. Use existing helper functions
to retrieve the relevant information.

Suggested-by: Rob Herring <robh@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/soc/imx/soc-imx8m.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/soc/imx/soc-imx8m.c b/drivers/soc/imx/soc-imx8m.c
index 8e2322999f0996d2723768469c6893b0ea22eb9d..77763a107edbd11302017e3f61ecb4369fda1ab0 100644
--- a/drivers/soc/imx/soc-imx8m.c
+++ b/drivers/soc/imx/soc-imx8m.c
@@ -226,7 +226,6 @@ static int imx8m_soc_probe(struct platform_device *pdev)
 	const struct imx8_soc_data *data;
 	struct imx8_soc_drvdata *drvdata;
 	struct device *dev = &pdev->dev;
-	const struct of_device_id *id;
 	struct soc_device *soc_dev;
 	u32 soc_rev = 0;
 	u64 soc_uid[2] = {0, 0};
@@ -244,15 +243,11 @@ static int imx8m_soc_probe(struct platform_device *pdev)
 
 	soc_dev_attr->family = "Freescale i.MX";
 
-	ret = of_property_read_string(of_root, "model", &soc_dev_attr->machine);
+	ret = soc_attr_read_machine(soc_dev_attr);
 	if (ret)
 		return ret;
 
-	id = of_match_node(imx8_soc_match, of_root);
-	if (!id)
-		return -ENODEV;
-
-	data = id->data;
+	data = device_get_match_data(dev);
 	if (data) {
 		soc_dev_attr->soc_id = data->name;
 		ret = imx8m_soc_prepare(pdev, data->ocotp_compatible);
@@ -326,7 +321,7 @@ static int __init imx8_soc_init(void)
 	int ret;
 
 	/* No match means this is non-i.MX8M hardware, do nothing. */
-	if (!of_match_node(imx8_soc_match, of_root))
+	if (!of_machine_device_match(imx8_soc_match))
 		return 0;
 
 	ret = platform_driver_register(&imx8m_soc_driver);

-- 
2.47.3

