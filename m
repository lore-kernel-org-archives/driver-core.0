Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 779EC2F6560
	for <driver-core@lists.linux.dev>; Mon, 23 Feb 2026 15:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771861284; cv=none; b=slGx1FYJ8Z2dLXv0jYG+eoNCAy/YWk7tv2ONt6/TFQJ5J2N8wJ+Hsq0dlwBt4oRdHV/tE1FuJJvNXzYmV8E5sUmYajK+Uha01oixUgTO5kuBgkE9rubTymhtnixMMehtSotD2/WQa07aM9k3LWoxkTjR7iCz8t8txNVyUJAv8xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771861284; c=relaxed/simple;
	bh=pfp8lGuppkfbsov8xZVJQOkfeWli3tXHXvnSscLckXk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=udjhmacYyEnh7bZFiTHxwQx++sXaX2wX64Le1guHu0Qmo7sU3dvXQhOjNkSLZG4jR3O7VncRaYeXAGiQD45XGNefDU3CBXFCFwFH/1WEUa0sLxj5tBAjHQ9L+uSoMcce2s/mZTQvX2fuuk21aQtyDft+yVavGWgsCxMr1ykeFgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ODaCUIbA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B57UzF2q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ODaCUIbA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B57UzF2q"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NFVcYb1200431
	for <driver-core@lists.linux.dev>; Mon, 23 Feb 2026 15:41:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yBxCPbD7cxg6fxa066CqNg9ovVGm6N9TVUFhuUjEzv4=; b=ODaCUIbA0YH38EQa
	obov5rr+Y34iUAuJxFvzVXNokPW6AM2FvZVhMYEavFz/wj/x0T2+s7HJHvy9AT/o
	zCDnTD+yH42/hlGFOn5akOZha1qqtTj5FcTSXHF7eYRKBatYJtOUJcuobkxpkSNM
	4X4J4kUk5YQ8h6WyRhd8kEnpI8dDgv3r4ORQ8UU5cCudLT6IFMaNEDQxYk9DZakR
	2RSTBC0AIJa4F2tSuahXR4OiCdsVpTHz3Vgdfqh8kLUz++eS0GaDpZ02LxrFDxAX
	dKBi/cFdpgNDGNzDAjjp1B4jUe13VN9iVMLS8fOcMofsRw6ovg7nMzMZFCPUUCO5
	3uVnfg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgn8r8uxk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Mon, 23 Feb 2026 15:41:22 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c71500f274so503541685a.1
        for <driver-core@lists.linux.dev>; Mon, 23 Feb 2026 07:41:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771861282; x=1772466082; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yBxCPbD7cxg6fxa066CqNg9ovVGm6N9TVUFhuUjEzv4=;
        b=B57UzF2qD2uB7OeIxSFLJYJo0mkMrIYfLK553pEoYWwEsTiRL1HRiklIF9mDnoUp8p
         A3qzfy8HWXYbWlN31SpRMi9NYKsqGW5T6QgXyS0OvcceDnj6M9SE+AVM9FlLlzXm3r4L
         rIkXbi1RjjyXwUVh4hZHm+30Iv5fadyLuuQp8OHK2cg/L5Nc37Dfglzl7YbDkN7EKKkE
         Sz2ulJaCr77kzFfWKQMmavpFVb4axWAMBWu0atQqDDV2W0EiHtFfK9lJtlFziNbVyr67
         y6LxhayRUlPxp7zlnC4m41Z4Zyil0hpkJPUILqrQVFvdTfwcjjpVM4Up/OrjKlkHM1Zr
         +vlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771861282; x=1772466082;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yBxCPbD7cxg6fxa066CqNg9ovVGm6N9TVUFhuUjEzv4=;
        b=b8lqX5SQ5w51VRplr9SNr+CWq7vuEMzzo7mjtkzpiWoFPZIk5xoNmtBO8K/fwgTb70
         LxdpH2+WY6O7ywmtNRjpy3g8G4/1fqlpENp6fRp6IWlmVvB/dq3M4ArOfj8OTU8CXpYm
         RwG3L03LQswbecQPunkfVVCT86ZhXsbcqyy2Uk840tctBxM8++tp9mLdrqKEsg3f0Ksw
         u98ONF8wbNfVfMf+hDfPo1lJBhkylNlDybIKOPQpFrQEwkFBHTZFOpQZVOhzBeDxnVFZ
         iT61dH7TzZ2+QVAvr+zSN0r+y+XFqLa3GzyWM3DAeq51Cojus1OJwBZItBSIlx0384Ae
         R4LQ==
X-Gm-Message-State: AOJu0YxxhPrwBvpGao8HA7PO0tSiwzGUJILHgJ159KfILMFs8sLJBvmB
	B8H4yc0LPKQHkufLZrBzuKNjHH5P6WlHO9wFUHCwWmu+OmdXVW6PLpp/XtgHZWXO9sq0ZcimwgS
	N24DW4MWfH762h6Sm3I2zXxSJeUf+y5J59yzKWSh2gYphpxGk4ST5tr+f618PvwHZeTRO/mZkpQ
	==
X-Gm-Gg: AZuq6aJqT/+lioV1ru+wwFCFzn2ImkTt2Cqhb+4hQHPmhDqy7E+4ehNJUH1QEZ0E7aG
	lffIGZAYLQPv0u2c4eSZOfMxJ5sJmbJHh+on+0BbRF8HDNJu2JZLA4SbP+7j3CqAx99wxokncGY
	TlxccqsVGAQVaQRib8FxhtEb9FwY4TNIYIoK/3AKPOVf+tNFgeEvwerzeekPWOsV31nDoRWrXqJ
	lP+KhJSMEyDAhlCnFZw6Gwv9nwg7BMUZvgxCF14liyhXZDXa/wpEqt9efjRQ3RNTM75ELAuzKYp
	7LKwndKdAx6YhfI5mN7vWk2ruibnJF924h7aSS4h9shspykF4zroB/g8VVaorW/T2a5sht89nFg
	KbZMU1rCsHQFB4vXIXyyHvG7HEFcigPRlS/UAuMAtfVFdtsQ+Vuna
X-Received: by 2002:a05:620a:4102:b0:8cb:3870:5c1d with SMTP id af79cd13be357-8cb8c9fe5b5mr1218901385a.27.1771861281814;
        Mon, 23 Feb 2026 07:41:21 -0800 (PST)
X-Received: by 2002:a05:620a:4102:b0:8cb:3870:5c1d with SMTP id af79cd13be357-8cb8c9fe5b5mr1218895985a.27.1771861281242;
        Mon, 23 Feb 2026 07:41:21 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:3fa4:55d7:7aa4:50d6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a31b3d88sm295266755e9.3.2026.02.23.07.41.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 07:41:20 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 16:40:52 +0100
Subject: [PATCH v2 1/2] driver core: make fwnode_is_primary() public
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-device-match-secondary-fwnode-v2-1-966c00c9eeeb@oss.qualcomm.com>
References: <20260223-device-match-secondary-fwnode-v2-0-966c00c9eeeb@oss.qualcomm.com>
In-Reply-To: <20260223-device-match-secondary-fwnode-v2-0-966c00c9eeeb@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Len Brown <lenb@kernel.org>
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, brgl@kernel.org,
        linux-acpi@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1418;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=pfp8lGuppkfbsov8xZVJQOkfeWli3tXHXvnSscLckXk=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpnHUbz5fZR9VccnEPbth0krmyJnnkHE7JFHh0l
 kJ3AXKZstGJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZx1GwAKCRAFnS7L/zaE
 wxN4D/9IvnuyHM2lRNXCv7mFlZd1TpW6H2vfx7M3xyQNZpdkwvC7cIk22PEZ0ApdtcYxhkBwqAm
 WHmOFHsPC/fy7pzNdBxbvvz4wVr9vNq9t8+el1I/CheCI7eJ464fW/COL2+5N8ETubExujFukhZ
 DhZssd783JD7lSZHH1Qd0sXrNInneThxh591xIDlqvQAcwWESug1KLSYTKpbGpYGGw0feot0K1U
 C8NeZOM0rfvqcA3dKHJbg9C4kws7KQhGUW1CkrWKqmkMkUaol+2QuCmVyL47LOKoTHg5hDy031Z
 wf6Y2Xcs73RmX3fmuSkig3cnEHTgpAv5GVldMXmErDSrIhgI2yS6y5yi2eGHaupX//wkQRYp0UA
 dvGNeCHzOQcsH1ny/IcEWuDGLkt+zMv6ZJtscgXv4PS1WXHAfM2gHC4X2qqW4qHefbdQtfNVqKN
 K+LCQHXRzSkINx9/nm63Uh6y+uU7sx5Nt/+UDQbz68b30g7Mh6qKB1H2vZzh8e/RJKhOvHo+fOw
 UhOliYfCjOgHp0wYUz2RWkFTtBZ8u741VkwLQ5/YGxeqHCnORoaGMuBsl+ldNmkc7IUA0gZKhZN
 VOHM8DZ8dAliZYQR22ERy7jTlUzUm/ufJ0DQVfzjJtCTVlglpewX7G+/ZGXyvwWbWELQMMX1GZQ
 hX+QZcJrFNRUQEA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: r8eLo2CHAvyKK-hhmgRE4IGLHSrPpKgm
X-Authority-Analysis: v=2.4 cv=V7twEOni c=1 sm=1 tr=0 ts=699c7522 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=PHKWDHO76ZnW9kbunpkA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDEzNCBTYWx0ZWRfXzQ1Gw1FEHWhh
 dO41S3jyPLcs+DLX6v4TKhvRhyBag7SyX8wVtiYmfjCLMccQlweBAmF4c3yTn6DZQ5YdxjpMdEK
 z+/JeszX7KX0Ig+pILs/kxK/xipHnyqmpYhuQsYpCXBulC6+SVfINHiBMrWQ7SbRzavxYLXgjJJ
 1ra7s4qQr6d2Gdr163d+00D8ISJWCOuHs8i3FXDmLhpQ2w/7XU39pnRQF9yAGNGm3TISzZy2qO+
 rduvD7XTTaqMWE71yP++fPvo05yPNHz1cnPs0wIaKGlTRGjysR1G5tWC1BPxfeWVszcboB6+HT1
 I50gqglbqCzyyiXdzHmJrMfz4YKoCwCwebDM6oUj7L+67+6wo8SAnQuXkYsF0wQzuarphIpiTqy
 mhLmlSd+JTH5mIXiI8nsW7V39wJBMxYpNv0bthp056oXu+UuV7tA9hyqg0FFbBsShrJNHaY7j1T
 wltUe8+JSgDug60NZ/w==
X-Proofpoint-GUID: r8eLo2CHAvyKK-hhmgRE4IGLHSrPpKgm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_03,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 impostorscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230134

Export fwnode_is_primary() in fwnode.h for use in driver code.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/base/core.c    | 5 -----
 include/linux/fwnode.h | 5 +++++
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index f599a1384eec90c104601422b04dc2b4c19d4382..2e551bbe591b09c66b113b419ba63f17e8bea94a 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -5122,11 +5122,6 @@ int dev_warn_probe(const struct device *dev, int err, const char *fmt, ...)
 }
 EXPORT_SYMBOL_GPL(dev_warn_probe);
 
-static inline bool fwnode_is_primary(struct fwnode_handle *fwnode)
-{
-	return fwnode && !IS_ERR(fwnode->secondary);
-}
-
 /**
  * set_primary_fwnode - Change the primary firmware node of a given device.
  * @dev: Device to handle.
diff --git a/include/linux/fwnode.h b/include/linux/fwnode.h
index 097be89487bf5c5a96f01d569c1691088db4f0ca..04db7f3ea50cceb9025c82c6449ba342d0e1b4a4 100644
--- a/include/linux/fwnode.h
+++ b/include/linux/fwnode.h
@@ -230,4 +230,9 @@ void fwnode_links_purge(struct fwnode_handle *fwnode);
 void fw_devlink_purge_absent_suppliers(struct fwnode_handle *fwnode);
 bool fw_devlink_is_strict(void);
 
+static inline bool fwnode_is_primary(struct fwnode_handle *fwnode)
+{
+	return fwnode && !IS_ERR(fwnode->secondary);
+}
+
 #endif

-- 
2.47.3

