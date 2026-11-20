Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795178839;
	b=4UjgsSi+qn+EcgW4wlvloUc0gzU9nej9Kp9yn0wvWXfLw/qKdlxnya+p4KZshgtJNxLk
	 b6kpBPJ/F8OvshXg+J253NxHSz/dAYHVNRMhY8U5KLan8kdzrxtDXN0mK1R8+lNUPvRWx
	 InsNSxRIK2zXny2/0aCwvkKXMFAimyl5H3y71MJZpDK5k5mpTErwiRcXHS5L2LquBSiB2
	 RSliMsXwD70+9tQFd1qMTZD9Kr/tgz+CcZ1SUf5oX9F3yYl9lw9+kg0cYN7F4/ixsVE+V
	 VFd+K89SSu3YEE4jET0YzSIwJKY/+Vkm/3uyMFIKot1MAhNrl2mdhyV62oqrdAJjKXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795178839;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=NS8BjovI5HLBofxvJMHQYZRCR3joIuKOlILvwQZbuIw=;
	b=tL8gtDhAJy3IOPmP6Jv2Hcy8R+TSfLSclJB0M1QjzVHtztEV9W7gF37sv0kLpqWMCqjM
	 c6+LYfWq43eM/LkCGxkoHOoGu6CLB5LUhEH7+pz0TGVqFpSinOIJIkXJWER5ddMOeRSvB
	 Ndex1WzNEXA6UG/vfaFcnO6xOZpggRw53itWgeASEtV54N+pUBgKVHeHq7PoBOTDWS7Qg
	 1ajrSUA2PbMJ66xDGtkzX4RuhZvUdWswcLrl8JXUFnYgG1RPAoR6r4zCWSLmzMO29XaeW
	 RauwYzjeWruAx6ESfLWiibb/hqss95PrAjsFPkRAulfLgro36g0xyWUfTa1Pb4jOXYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A4HDSQWb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D1lzjiS1;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69E2560A261C
	for <driver-core@lists.linux.dev>; Fri, 20 Nov 2026 12:47:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69E2560A261C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A4HDSQWb;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D1lzjiS1
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKCFarA1256942
	for <driver-core@lists.linux.dev>; Fri, 20 Nov 2026 12:47:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NS8BjovI5HLBofxvJMHQYZRCR3joIuKOlILvwQZbuIw=; b=A4HDSQWbiD6HZnqb
	rtwVMxR9QACZoxdiDvE2TqezA4MQJBrot46ceTynX6t2Ays7OJNgX8Irc5bjNXFJ
	rcfd7enmeAxKVcxWkk4twTTQZdQZSa5p/QYlOauPK0rgUK0sjlJqqDs85NfLe7bt
	nNohHEvvywLaxN7nSbtda/8bqVDd4CMbnJZsHAPBTVpdLnwGAwXThgfrdd3vPQU/
	myD8NpXKqWHOgP0kbZJyCBdt1dE2VtdPaYX3RznmRpUMbq4PYc2Ti6BJ1h8HuHcQ
	duongUjmWUmZ7Th/aTtZsPlaFouN+Y3zi45RJR8ILKLIdwbQtS120YCa9yo8Uunl
	wiaR9A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j27fykr1j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Fri, 20 Nov 2026 12:47:18 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f5844e383so156641085a.1
        for <driver-core@lists.linux.dev>; Fri, 20 Nov 2026 04:47:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795178838; x=1795783638; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NS8BjovI5HLBofxvJMHQYZRCR3joIuKOlILvwQZbuIw=;
        b=D1lzjiS1+CqCUce33GXgFcVZn5stOBycg0NwQ3LWIEN7V9hVIVgArlXaQV37n5jtF0
         dTqhlpRY6tk24JMFRycN5WY8gV0l2vk5XYjL7fyIOwPyRE3TH7/jqfgxLu6qt4NbD9cG
         JznhpBrQUxKp3rysZmcW0OLOjsTisLrMKB1b3DS+epBM0rXpQ9sxsxfqQlQGqnvprRq5
         QsbZkwm/8KGQ7mbDhb02ZT35MOXfN5fWSXxDvE17mdSqOX6uUZoyrhmaLVpGKvg05EdZ
         i9RQPjzRUx8sN0MtxMEFhpl9eq31CvZ/76gx1eltXz7FWVnpM9Ly2UI5Qoha5Xtd3lVU
         6tgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795178838; x=1795783638;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NS8BjovI5HLBofxvJMHQYZRCR3joIuKOlILvwQZbuIw=;
        b=RhhktYlu3HllJrs8AdnZ1qCMH7eustSe8dDE/EYLu+CNkx6BKsLKb0A85b/E/c2G3g
         Ez6QjnatLoNNomsgcI+tXB2fiXevaTEHgSItGTnfIG0QYYiXVnx2Dw2qOOvf+of5PbKR
         +4yIsDsRZzGP7gXqZe8P0v8xnyrdS4lzAazSpScZSd+J4LBXshlvSEd5MxUkOFsnbApd
         pRfXgwv/7pOhcaiXoFGdRTgOOh+XF0nCENA4do6Um0UGXPM7BZLiZt0+09m5ViXLaivO
         U7UEH/SnGwK0040YcQxWZqhzSmXp9N21VSu2hvD9bWyoIPsXRycK8NwakFfQVGRHBJ47
         pFDw==
X-Forwarded-Encrypted: i=1; AL+hErGvB3Z2gY2WlDeC42954BXkfFqjexebRpNGoUPAPecK7hJV0MGGIYCZW0JVYT1pgh4Yjxb7ub8J3oEudw==@lists.linux.dev
X-Gm-Message-State: APuU4Z8MqdLIsB9y0meDZtkKqfBKlI+gKJvrZC2oGKyuiXbJkzQeJcAB
	Tvp/HwW7BVX4Ib/Xe+sG3ra4IznEzNAfFAW3oLyLAfNgYwG6DDw6ZDXlQuCmEIb9imwg6EkCFcf
	rxIneeFx5zfG7CkMnq8lA+/XZ67jfuZGJbYSQ2OdB4WOTlCo0c+Rat3cHQDL5+nmlxw==
X-Gm-Gg: AYBFou1C0/8X3yhNtjaP99tNmL64TjLUtC0SNQiKalUGTSVAKjme+20AxMUzwd7hVVk
	NnPUBCyA8jq8D3z6NSHCmLfdOSxcnG4jV6Zrd6BLVyEivhxFKYYmWG9iwca7J6DkCGgDK+wEveS
	h3YT6BpLUyc/Na/ul7J0A0hcjvHelUAwbyu//G4mpNswoJ8jjwpbCeUwSixRaQp0Md8bSxLSqmd
	1hWED1vcnABVQqF0vkX7v3z9FU2+pGenAt7bzULXL3m1zsobwDWfJXgd/c8ru0tjRuOcgQbu63t
	e3fJev96jHY+GiPYUc5Za0vpsoK6yql6k74JzbWaxj81Vn7frNxFDfH9ThO85+TM8+CYiwDAtRW
	eVQypefUPVpaF0N6EH3Pe3seRc+kmgzcdSfyzcKCK8pulrox1h9OAzSMxP2yxkwhmb8Nuq13bCv
	M=
X-Received: by 2002:a05:620a:4492:b0:949:7fb4:2712 with SMTP id af79cd13be357-949bab123c2mr454612285a.66.1795178837670;
        Fri, 20 Nov 2026 04:47:17 -0800 (PST)
X-Received: by 2002:a05:620a:4492:b0:949:7fb4:2712 with SMTP id af79cd13be357-949bab123c2mr454609285a.66.1795178837182;
        Fri, 20 Nov 2026 04:47:17 -0800 (PST)
Received: from brgl-qcom.local ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884ab091sm119248995e9.11.2026.11.20.04.47.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 04:47:16 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 13:46:47 +0100
Subject: [PATCH v3 10/10] gpio: shared: generalize most code to firmware
 nodes
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
Message-Id: <20261120-fwnode-for-each-prop-v3-10-808e304dc73e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=10642;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Iv1IM5MIQo5zDnbSeGyHkNB7sywHcbJdjw/Y4b/rMx8=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrAEE4dhvnqlk3Wr6j2erkEhrd8hVycyEjLcRAS
 b+Pr2rWQVCJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawBBOAAKCRAFnS7L/zaE
 w0ToEACB14ApfaKZHAECsmUMushTze/aQzofn9c5/yYGY4u0E7D1ZKw3mf65lq7arf4riCHqhY9
 /GGO+EN62WQeAY5PcYlqergHrjsMi517+O2xvf2zKnHBgBDeLyVnkpAYJRpYbWArgrxXcZmJ1Bd
 13lUVdr0tvWLWIHeuBqj3r5Q8FK6Zvq/X9IDvZbzVOX/LMa+I3V/TBgr0LbV994ZYl1klDz7ekF
 7t7GxVYp3XbFc++85rWtXIqZvArsQLvSwKIlpTOpF6HxBDjFR3m/60bNG2lch6svfbtOpiIUoDR
 nI2Blq5RILL8f3nOkFmEkvCQI2fAEonvUaLCDLfdKOcop1yN4zerYN23vq1DNJ0WzrTCRMQ0F0X
 Udl7YUI+HZEQL45EnnY/jvQo8TvXBmeyOSz0D49TDFL6aENZywtV8PIy2C/UXv8h72jiDOcc+gV
 FaCfyh693TCvJpu1kzVaSmM7oW1U6oDF7WzrI/mbPYkkjKRMLjIPtj7yiTBonWdkljS9FEV1GWs
 CmAm+sTPFbHFZjOvofsmi/UghzjYVTjKVKzWrzqd37p7A6OBi3cKD8ao9TodsfrVus5mnXXH+OB
 pFi4YHrmDCQ2mgwpYB65GAAsFAvlE2l8MPh0UZz0qjUFVNqsDj2+FEg0iu4Grh+byoz8G++vsBj
 Qge2/Wfdzegj9Dw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1MCBTYWx0ZWRfX4W78/A9xnOOS
 +SLw6yo3qYDox7Ih0YZg3xu2E8DDbG2z54X5XBoZ7rtnJdi26NORY10J6B9rLsomZJKpzjoPDEZ
 04us6NU3/RBCvEOu9K8hggA50X+6IAU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1MCBTYWx0ZWRfX7xLMbBZBliYa
 xj0uziPyoV68YRCGqZCCP84DnvH+Xz87RFsZFYAqMBX7xpRXBg1yX9qfrqHzSa5XCyq+MKGv/eB
 U1ctbIZxtG/zfwN1DO8+DtcvqEMAPzyJF1keVoHfpJfIK8Sf4JkuoebVqu77Vd5NMmMaRnMBrXo
 fGPQBJnlroWGvrgW3zKGIbvwGsKg4RI2frKpcunWjQyWl9dl2TgPt/Ril0iZp1jvjX9Th9vaCYg
 cMDUnR9s4I/M4xZZbZdcchz7hlNAJvGpLdnrCJUV8OOHxTO62kQb9lXvwOGuiVITWLOwOsk3X0n
 mDn+gmGYYuSHgC3RY5fR8frpwdp4fGfv7evFPYtQvMNQvaJSv2Jxu/R2W+DXBkeCwKhJ7reUn4V
 vZKzyGzylCtd0XHnCvINhB5NGvELqTaxj/+BGDKx2xakURhOYS7ATwXJmSU6foPZcou3YciwiKy
 itbf9yrrSXcn2TlMr6A==
X-Authority-Analysis: v=2.4 cv=GZKCDgXL c=1 sm=1 tr=0 ts=6b004156 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=ziVQ5hnd3nnfPSIR4FkA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: xCgJSoWD8X0Hr1oKO7hXgNiwRqtFlFvk
X-Proofpoint-GUID: xCgJSoWD8X0Hr1oKO7hXgNiwRqtFlFvk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200050

Ahead of adding support for sharing of GPIOs for other types of firmware
nodes, convert as much code in gpiolib-shared.c as possible to using
fwnode APIs and guard the remaining OF-specific bits with CONFIG_OF
guards.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib-shared.c | 236 ++++++++++++++++++++++--------------------
 1 file changed, 125 insertions(+), 111 deletions(-)

diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
index fbabc1ee489f881084033f7b92b42397455f5811..3b40874fc6a0e6b4591b58b164030ea73a355d2c 100644
--- a/drivers/gpio/gpiolib-shared.c
+++ b/drivers/gpio/gpiolib-shared.c
@@ -22,7 +22,7 @@
 #include <linux/printk.h>
 #include <linux/property.h>
 #include <linux/slab.h>
-#include <linux/string.h>
+#include <linux/string_helpers.h>
 
 #include "gpiolib.h"
 #include "gpiolib-shared.h"
@@ -60,7 +60,6 @@ struct gpio_shared_entry {
 static LIST_HEAD(gpio_shared_list);
 static DEFINE_IDA(gpio_shared_ida);
 
-#if IS_ENABLED(CONFIG_OF)
 static struct gpio_shared_entry *
 gpio_shared_find_entry(struct fwnode_handle *controller_node,
 		       unsigned int offset)
@@ -126,157 +125,158 @@ static int gpio_shared_setup_reset_proxy(struct gpio_shared_entry *entry,
 }
 
 /* Handle all special nodes that we should ignore. */
-static bool gpio_shared_of_node_ignore(struct device_node *node)
+static bool gpio_shared_fwnode_ignore(struct fwnode_handle *fwnode)
 {
 	/* Ignore disabled devices. */
-	if (!of_device_is_available(node))
+	if (!fwnode_device_is_available(fwnode))
 		return true;
 
 	/*
-	 * __symbols__ is a special, internal node and should not be considered
-	 * when scanning for shared GPIOs.
+	 * On OF-systems __symbols__ is a special, internal node and should not
+	 * be considered when scanning for shared GPIOs.
 	 */
-	if (of_node_name_eq(node, "__symbols__"))
+	if (fwnode_name_eq(fwnode, "__symbols__"))
 		return true;
 
 	/*
 	 * GPIO hogs have a "gpios" property which is not a phandle and can't
 	 * possibly refer to a shared GPIO.
 	 */
-	if (of_property_present(node, "gpio-hog"))
+	if (fwnode_property_present(fwnode, "gpio-hog"))
 		return true;
 
 	return false;
 }
 
-static int gpio_shared_of_traverse(struct device_node *curr)
+static int gpio_shared_fwnode_scan_property(struct fwnode_handle *curr,
+					    const char *propname)
 {
+	struct fwnode_reference_args args;
 	struct gpio_shared_entry *entry;
 	size_t con_id_len, suffix_len;
-	struct fwnode_handle *fwnode;
-	struct of_phandle_args args;
 	struct gpio_shared_ref *ref;
-	struct property *prop;
 	unsigned int offset;
 	const char *suffix;
-	int ret, count, i;
+	int ret, i, count;
 
-	if (gpio_shared_of_node_ignore(curr))
+	/*
+	 * The standard name for a GPIO property is "foo-gpios"
+	 * or "foo-gpio". Some bindings also use "gpios" or "gpio".
+	 * There are some legacy device-trees which have a different
+	 * naming convention and for which we have rename quirks in
+	 * place in gpiolib-of.c. I don't think any of them require
+	 * support for shared GPIOs so for now let's just ignore
+	 * them. We can always just export the quirk list and
+	 * iterate over it here.
+	 */
+	if (!strsuffix(propname, "-gpios") && !strsuffix(propname, "-gpio") &&
+	    strcmp(propname, "gpios") != 0 && strcmp(propname, "gpio") != 0)
 		return 0;
 
-	for_each_property_of_node(curr, prop) {
-		/*
-		 * The standard name for a GPIO property is "foo-gpios"
-		 * or "foo-gpio". Some bindings also use "gpios" or "gpio".
-		 * There are some legacy device-trees which have a different
-		 * naming convention and for which we have rename quirks in
-		 * place in gpiolib-of.c. I don't think any of them require
-		 * support for shared GPIOs so for now let's just ignore
-		 * them. We can always just export the quirk list and
-		 * iterate over it here.
-		 */
-		if (!strsuffix(prop->name, "-gpios") &&
-		    !strsuffix(prop->name, "-gpio") &&
-		    strcmp(prop->name, "gpios") != 0 &&
-		    strcmp(prop->name, "gpio") != 0)
-			continue;
-
-		count = of_count_phandle_with_args(curr, prop->name,
-						   "#gpio-cells");
-		if (count <= 0)
-			continue;
+	count = fwnode_property_count_references(curr, propname, "#gpio-cells");
+	if (count <= 0)
+		return 0;
 
-		for (i = 0; i < count; i++) {
-			struct device_node *np __free(device_node) = NULL;
-			char *con_id __free(kfree) = NULL;
+	for (i = 0; i < count; i++) {
+		char *con_id __free(kfree) = NULL;
 
-			ret = of_parse_phandle_with_args(curr, prop->name,
-							 "#gpio-cells", i,
+		ret = fwnode_property_get_reference_args(curr, propname,
+							 "#gpio-cells", 0, i,
 							 &args);
-			if (ret)
-				continue;
+		if (ret)
+			continue;
 
-			np = args.np;
+		struct fwnode_handle *fwnode __free(fwnode_handle) = args.fwnode;
 
-			if (!of_property_present(np, "gpio-controller"))
-				continue;
+		if (!fwnode_property_present(fwnode, "gpio-controller"))
+			continue;
 
-			/*
-			 * We support 1, 2 and 3 cell GPIO bindings in the
-			 * kernel currently. There's only one old MIPS dts that
-			 * has a one-cell binding but there's no associated
-			 * consumer so it may as well be an error. There don't
-			 * seem to be any 3-cell users of non-exclusive GPIOs,
-			 * so we can skip this as well. Let's occupy ourselves
-			 * with the predominant 2-cell binding with the first
-			 * cell indicating the hardware offset of the GPIO and
-			 * the second defining the GPIO flags of the request.
-			 */
-			if (args.args_count != 2)
-				continue;
+		/*
+		 * We support 1, 2 and 3 cell GPIO bindings in the
+		 * kernel currently. There's only one old MIPS dts that
+		 * has a one-cell binding but there's no associated
+		 * consumer so it may as well be an error. There don't
+		 * seem to be any 3-cell users of non-exclusive GPIOs,
+		 * so we can skip this as well. Let's occupy ourselves
+		 * with the predominant 2-cell binding with the first
+		 * cell indicating the hardware offset of the GPIO and
+		 * the second defining the GPIO flags of the request.
+		 */
+		if (args.nargs != 2)
+			continue;
 
-			fwnode = of_fwnode_handle(args.np);
-			offset = args.args[0];
+		offset = args.args[0];
 
-			entry = gpio_shared_find_entry(fwnode, offset);
-			if (!entry) {
-				entry = kzalloc_obj(*entry);
-				if (!entry)
-					return -ENOMEM;
+		entry = gpio_shared_find_entry(fwnode, offset);
+		if (!entry) {
+			entry = kzalloc_obj(*entry);
+			if (!entry)
+				return -ENOMEM;
 
-				entry->fwnode = fwnode_handle_get(fwnode);
-				entry->offset = offset;
-				INIT_LIST_HEAD(&entry->refs);
-				mutex_init(&entry->lock);
+			entry->fwnode = fwnode_handle_get(fwnode);
+			entry->offset = offset;
+			INIT_LIST_HEAD(&entry->refs);
+			mutex_init(&entry->lock);
 
-				list_add_tail(&entry->list, &gpio_shared_list);
-			}
+			list_add_tail(&entry->list, &gpio_shared_list);
+		}
 
-			if (strsuffix(prop->name, "gpios"))
-				suffix = "-gpios";
-			else if (strsuffix(prop->name, "gpio"))
-				suffix = "-gpio";
-			else
-				suffix = NULL;
-			if (!suffix)
-				continue;
+		if (strsuffix(propname, "gpios"))
+			suffix = "-gpios";
+		else if (strsuffix(propname, "gpio"))
+			suffix = "-gpio";
+		else
+			suffix = NULL;
+		if (!suffix)
+			continue;
 
-			/* We only set con_id if there's actually one. */
-			if (strcmp(prop->name, "gpios") && strcmp(prop->name, "gpio")) {
-				con_id = kstrdup(prop->name, GFP_KERNEL);
-				if (!con_id)
-					return -ENOMEM;
+		/* We only set con_id if there's actually one. */
+		if (strcmp(propname, "gpios") && strcmp(propname, "gpio")) {
+			con_id = kstrdup(propname, GFP_KERNEL);
+			if (!con_id)
+				return -ENOMEM;
 
-				con_id_len = strlen(con_id);
-				suffix_len = strlen(suffix);
+			con_id_len = strlen(con_id);
+			suffix_len = strlen(suffix);
 
-				con_id[con_id_len - suffix_len] = '\0';
-			}
+			con_id[con_id_len - suffix_len] = '\0';
+		}
 
-			struct fwnode_handle *curr_fwnode =
-				fwnode_handle_get(of_fwnode_handle(curr));
-			ref = gpio_shared_make_ref(curr_fwnode, con_id, args.args[1]);
-			if (!ref) {
-				fwnode_handle_put(curr_fwnode);
-				return -ENOMEM;
-			}
+		ref = gpio_shared_make_ref(fwnode_handle_get(curr), con_id, args.args[1]);
+		if (!ref) {
+			fwnode_handle_put(curr);
+			return -ENOMEM;
+		}
 
-			if (!list_empty(&entry->refs))
-				pr_debug("GPIO %u at %s is shared by multiple firmware nodes\n",
-					 entry->offset, fwnode_get_name(entry->fwnode));
+		if (!list_empty(&entry->refs))
+			pr_debug("GPIO %u at %s is shared by multiple firmware nodes\n",
+				 entry->offset, fwnode_get_name(entry->fwnode));
 
-			list_add_tail(&ref->list, &entry->refs);
+		list_add_tail(&ref->list, &entry->refs);
 
-			if (strcmp(prop->name, "reset-gpios") == 0) {
-				ret = gpio_shared_setup_reset_proxy(entry, args.args[1]);
-				if (ret)
-					return ret;
-			}
+		if (strcmp(propname, "reset-gpios") == 0) {
+			ret = gpio_shared_setup_reset_proxy(entry, args.args[1]);
+			if (ret)
+				return ret;
 		}
 	}
 
-	for_each_child_of_node_scoped(curr, child) {
-		ret = gpio_shared_of_traverse(child);
+	return 0;
+}
+
+static int gpio_shared_fwnode_scan_properties(struct fwnode_handle *curr)
+{
+	char **props;
+	int ret, i;
+
+	ret = fwnode_property_get_names(curr, &props);
+	if (ret <= 0)
+		return ret;
+
+	CLASS(strarray, names)(props, ret);
+
+	for (i = 0; i < names.n; i++) {
+		ret = gpio_shared_fwnode_scan_property(curr, names.array[i]);
 		if (ret)
 			return ret;
 	}
@@ -284,19 +284,33 @@ static int gpio_shared_of_traverse(struct device_node *curr)
 	return 0;
 }
 
-static int gpio_shared_of_scan(void)
+static __maybe_unused int gpio_shared_fwnode_traverse(struct fwnode_handle *curr)
 {
-	if (of_root)
-		return gpio_shared_of_traverse(of_root);
+	int ret;
+
+	if (gpio_shared_fwnode_ignore(curr))
+		return 0;
+
+	ret = gpio_shared_fwnode_scan_properties(curr);
+	if (ret)
+		return ret;
+
+	fwnode_for_each_child_node_scoped(curr, child) {
+		ret = gpio_shared_fwnode_traverse(child);
+		if (ret)
+			return ret;
+	}
 
 	return 0;
 }
-#else
+
 static int gpio_shared_of_scan(void)
 {
+	if (IS_ENABLED(CONFIG_OF) && of_root)
+		return gpio_shared_fwnode_traverse(of_fwnode_handle(of_root));
+
 	return 0;
 }
-#endif /* CONFIG_OF */
 
 static void gpio_shared_proxy_dev_release(struct device *dev)
 {

-- 
2.47.3

