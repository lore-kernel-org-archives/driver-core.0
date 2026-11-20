Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795178831;
	b=WNC6j+fp45QJ7jX6ihX9aAmq4Xjcp4UrmFZJdsuyP+eWEinE1yMIlRg3U0XLRfAECYEh
	 2ayCOCzgM/YPxUQzubXrWpRp7YrSeQNm1xe7bJqC4crqWcwvCZyyHj39mtEer5F2uj8S8
	 oALTrF8sEchP8flfYT5SbPc4ckLYHtxK1IyYZ5fPf25MFjb8IUSmkZbQeHcfhDjE3kL4v
	 M3suj9GQwKEgACcRyIOcID6AGUt3e5A/Mf97QR9EwiJ0hH2+YmyD6jNye6ZTXrD6Rs8Bc
	 XCc1wKAy6QyfAHdF2Abd4tPo8pway1uljKhOWSV7o6QqbL5jd0gjsWZSSoR9lkfcRqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795178831;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=itd8Y+uchN2HJrYq4RSPlfZt/iDxc9zWsOFSO8a/jcY=;
	b=CiFLkhcblsCOXV4qe2ZGsywV/YTYU0xbHDCBI5FNqZab5qZAkMFUYo9/pHt4a8ucBPoB
	 L0FWwHasBjCDk4USjSDNh6+jK+UYQ0sUnVKXk15NLxhxr1FfQqnhNM8DtGjRgYnZ+AOd6
	 Pmm32eSjenAUBMeSARS2Ed86oYNr1sgEk4dOiIwiPEiGFrRe0f1bvpXHbQX5fLHdYow9U
	 blXrPIrzlnYtqtUeAg+WGkch6AbnQ1b7hT+iibHeUor5bdyssyucDW6cyoKvCv593Qn3w
	 7JT+38/PwLE0PY+k7cDHC1EdXsmjU+I/eyLbf2Phsd+Odc/PIZBwLrmLrKXRVah5ZAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kAGwoYqj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VidC+XPi;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BAAD606A330
	for <driver-core@lists.linux.dev>; Fri, 20 Nov 2026 12:47:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BAAD606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kAGwoYqj;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VidC+XPi
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAjrI53731069
	for <driver-core@lists.linux.dev>; Fri, 20 Nov 2026 12:47:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	itd8Y+uchN2HJrYq4RSPlfZt/iDxc9zWsOFSO8a/jcY=; b=kAGwoYqjsmEOPEvP
	RG+KpqsE5zTdml35zlezIrOW9bKHXwW2kZmk6LInh59yRJVcubAJlwRE6yz1eQp4
	tlIpsbo0fM3C7HjmfNcN1gBnKO3TCQy0Zdn3vKhEt4+cXYIbrcCxc6DwuwMoLVUc
	35bGjsWoQRFJrZB+tzVKEzXnTnraP6EJ2tllQ2IyYqwCYKLpvfk236uFKkFkjcnm
	gRjtbZCM/qHwJ86d8OXDIBHXk8l5Ww2xRQeE6mRLm4x1d0k+DYqbz+phvoRNdxEH
	QIHP66dFfcFigzkpoAy5Xcqap7Ybg5UqUEa7ZXXl8pZg9NjSzhXZFzRV4HUitGzv
	6J335g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2mm4gfu9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Fri, 20 Nov 2026 12:47:09 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f26dd2165so232934685a.3
        for <driver-core@lists.linux.dev>; Fri, 20 Nov 2026 04:47:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795178829; x=1795783629; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=itd8Y+uchN2HJrYq4RSPlfZt/iDxc9zWsOFSO8a/jcY=;
        b=VidC+XPiCkbBNaRsAOrTTMX5yfmdctktZFsm0JHD9hSSBeWmArrCHDSPH2P7ztvijx
         tKbNXh5qn9VORjj6b8r7rQSMWoLRQ4OwmythGCkXdOkw5rlCc482lToh/t6QJZuskvlm
         AhQLbBjLN3uIh1ZLnoNFMYDkL6HAcWyZj5BDHMx2pRXXadwa6DOEwzO5/aC8fuQmntRE
         DlTZv3i+Yorjq7ZrCHtgCGglYx6mRaTlTilfbcyZmjorc7BKaIOIu6jSQ7kzPqe9otz+
         2J4FOQYqlcrpniH6ICVitKN+gL8X8+lQ8MpI3P9OIKxUXgxv8Jf6VxreRke3nmOMoyTU
         92wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795178829; x=1795783629;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=itd8Y+uchN2HJrYq4RSPlfZt/iDxc9zWsOFSO8a/jcY=;
        b=fCX5m58DN9gOFCYbetolbnMdGNg+votdCfy5AhpyOayJtXuxD04YpxDrcgNigEzOSe
         YKN8/tEIk4z6k/uwK5LkQJXn+uHFnqOKjgJO+l66gqHS4kWS6Rb2tW7Au7sEdrF0+SpE
         IkIhjvLOHQJtdsSH5tMKbVZvFrxU2h9IGDJtRBIk/qREaeKuaozeaJqQxI3EpdGe7s5b
         R92xcL/rkVImB/Ph8/tKDQZWxU5ZVZHSaE4fQ3DaTqhMiyk3LNiosL3sfH850n8+TjOH
         vcCWrKquotwNKXBi7nky5kcMYi1iu7LDRtQ5+V1VdijWDDM/oXT1hGdMEQZcXKT5H3C+
         eZVw==
X-Forwarded-Encrypted: i=1; AL+hErFAaGnWaI8lDW1L7WnOUvqCdK1pTbD70gz1WA/Y/mrFvmGADLd4WfAI/B2IsGowEcc04pos/qQdwWZCOw==@lists.linux.dev
X-Gm-Message-State: APuU4Z8CPqLU8IqKqL8GE+gcqhSIUwxrC8rW3mWyprW+tMBPZZoKtxFx
	9Gx8aF/qr92N2BfAZ9aCwe/NqiZJkrTYh7N8tC1/5zgdIWv69B8JZ9YIwgGW6uqR/lVTmon9qJT
	6XTMq/w9fCA1yTU6CsDeTFKCnMTnccTFIXDGkzXwYSeE/kNTdd4S6taqt2fn4sRkqqA==
X-Gm-Gg: AYBFou2mtT/QEOiJAB4xaG9hKWe/IC7Ul8cUGskajJVboiVVjM7kSXqAnx1IcE1XPYk
	OejFR2hNBZzjGpegQ6TbFA+hnKVLtfURsOzRa5eUWax0VkoDMIX4VIZ7+FTUFu4CumCaljVpCMj
	sSDiT7X6/o/QNc27viwsctL1Y7EaUSKJBHr3ircFvm2TxjwSSg1ugc8aSZmltqtX6MJ/4uyiOXi
	kzHvJVzlseaZTqQDvzk4qMrWthCpj6TNzwXtwskOP2/mdCvKAUJkj0aKnPxsdKp6iUcRHw84plA
	6rN+8fZpFzOdfTDiWilG9U/VbWm0Ibap4zUxjMh2osZ7cTjLLoNx/3ZQ1QMkCcc4c14a375szRg
	X9Vqj4kAH1vM8BpxqmdNGbFGkeBS0Jv7Ya6uXtgx5ZMG/eiNBqiMY9UYPRosqgHbr9YO7H5n2cJ
	8=
X-Received: by 2002:a05:620a:4453:b0:93e:c12c:fbba with SMTP id af79cd13be357-949bab47df4mr465802685a.71.1795178828541;
        Fri, 20 Nov 2026 04:47:08 -0800 (PST)
X-Received: by 2002:a05:620a:4453:b0:93e:c12c:fbba with SMTP id af79cd13be357-949bab47df4mr465795585a.71.1795178827983;
        Fri, 20 Nov 2026 04:47:07 -0800 (PST)
Received: from brgl-qcom.local ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884ab091sm119248995e9.11.2026.11.20.04.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 04:47:03 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 13:46:43 +0100
Subject: [PATCH v3 06/10] fwnode: define the count_references() fwnode
 operation
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
Message-Id: <20261120-fwnode-for-each-prop-v3-6-808e304dc73e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1638;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=uLLErtVyyBCCkNg/MASZUF+mZGiOHH8LUrLC/RKjXs4=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrAEE3uresk7TAtJ8rliLvhk3SedImd2uTEfvXz
 2xdszcr3XeJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawBBNwAKCRAFnS7L/zaE
 w6LmEACYmRIPS0gPFt2gflTXMQeY2t8+0rQqwmjThzMGX0djCywgpXZ3HDOGp7XitV+81T0yfY8
 iKtdUOG5Zvi5dJSBWI6R3VZIyFj/1NGOMWOCuti5JkgVqm2Tve3KQDazZJwgjZfvaPndgpbw5KP
 CxYXQ3YftxvsbooRE9DQkRSkZ056NIaRtJWUH2a2w4QVnS/Kmfk0ZD3/SmwAgaHkm79Ma3jpAWP
 Mu0Ke9tCPBAaochJ+RAJoMC9jRWd5Jkbzpa/wW2xDiTn8bK8IleJivLvnxnLFQi6jSencLgOGPp
 m7P+g02A/eeTZUsnHXUnVE5ZmOYo15yzDN60ErDsZu/98O+Ch8PeVd54PVyD3rqpbqWjiAyPAa7
 kGlp9G57fMEZv57qUFcZPAx85AYSNx0W/FmaXn/vbfvMsmIAgy9ve2HFXeywf83gr59lsdzfxu8
 ODfZeZ6XXhefRH7nQZFgHxsE5T3yEFnpqGJVJ9N2z8sIw5PQ/x1lJsIz7F8GillN3O0eqPPUroe
 fnB7/Jec2MbvozCzZXSYBdhnVzwWhxUZbsTVch1xl1gdhj6BjiECQCvPol4hby0jzwZubuJQ7E3
 21kBn2CKKGgGfGsMti+vvqoAJ/0QFEd/SnRz+B5Cyvo8Bp6LC4+35IOtDzTHSCVaJohD9Zji5bl
 8quoz9OFXG2XsSw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: X2SnN8LABuFWX1j6tJUE0konn0XLELL8
X-Authority-Analysis: v=2.4 cv=RZYFmFtv c=1 sm=1 tr=0 ts=6b00414d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=pu8Hlg4PHyDR7New1bsA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1MCBTYWx0ZWRfX6MxokuUhkIQY
 vl0ZH3K1rG9KSYkVwFGXPbrimxnwTQIfRd1rV3x4naOY2DDF7F1svsZ9btR06+LZE4W2wruQsZU
 lxDVIQgIgJ5ZbBxVoXOjyZ5pHp+VfP8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1MCBTYWx0ZWRfX/MDSSBOfGNnQ
 9T/nOTJ1uJyknhYgZ7Dnj3TSBtAwCmU1DcnydUH1wIulNVINmBBTDx0I6O51x0oQiEMeDlqXu2+
 do5hYlI+sQTEO/zw15tlasl87a0H9wBzyenGHb7Nwb0VCxGWV70mdF1E2bWy0S/lmxRmONUOsbb
 SWsua4nBkb38+z4seLwXIzNXc5R8tBJvQzhUwjc7vhiANLmybwi+c+zeL240UncPbhNjzOYxtDb
 PY+YbR0hDQdxXmoIjNG053v/roD3akeq3SPKPkgOMqWXpZuRVrjUR6pUMusOrahHPoYNUK4Y/2K
 p0Gz2T6h30ai8It+ig1X5rdA64QkMpd0aQI8NsFwF8tWikhLEx+30Fk38uVvx0FgLHr8FKx+KQV
 95n90ih6ghHgLK93Q1ePfVMWZJJ1iuTt2woeixpHS+mOPsThhkkkXM1YZQxARkg9l1GJPISKbz7
 T9CHohfpJ99nE5Bt1SQ==
X-Proofpoint-GUID: X2SnN8LABuFWX1j6tJUE0konn0XLELL8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200050

Add a new fwnode callback allowing to count all references of given
firmware node.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 include/linux/fwnode.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/linux/fwnode.h b/include/linux/fwnode.h
index 2d7e0b9245d445d473c7317bd27058abe5750b40..15acade60564ddb5f5a48f2235b626466d77dbdf 100644
--- a/include/linux/fwnode.h
+++ b/include/linux/fwnode.h
@@ -137,6 +137,10 @@ struct fwnode_reference_args {
  * @get_parent: Return the parent of an fwnode.
  * @get_next_child_node: Return the next child node in an iteration.
  * @get_named_child_node: Return a child node with a given name.
+ * @count_references: Return the number of references in a property, including
+ *		      empty ones. @nargs_prop names the property in the
+ *		      referenced node holding the number of arguments, if NULL
+ *		      the references have no arguments.
  * @get_reference_args: Return a reference pointed to by a property, with args
  * @graph_get_next_endpoint: Return an endpoint node in an iteration.
  * @graph_get_remote_endpoint: Return the remote endpoint node of a local
@@ -180,6 +184,8 @@ struct fwnode_operations {
 	struct fwnode_handle *
 	(*get_named_child_node)(const struct fwnode_handle *fwnode,
 				const char *name);
+	int (*count_references)(const struct fwnode_handle *fwnode,
+				const char *prop, const char *nargs_prop);
 	int (*get_reference_args)(const struct fwnode_handle *fwnode,
 				  const char *prop, const char *nargs_prop,
 				  unsigned int nargs, unsigned int index,

-- 
2.47.3

