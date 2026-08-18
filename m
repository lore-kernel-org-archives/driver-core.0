Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [4.193.249.245])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70ED233344A
	for <driver-core@lists.linux.dev>; Tue, 18 Aug 2026 06:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=4.193.249.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787034397; cv=none; b=PhYTZXlXAUn+x+0GLC/0K8DmiCQUnmGbTmTKCKBDVmqsfZHTAA+lF4Rtxmmk4SUVo0Q4oSj3TK6HeBaNbjQB5vufwIIqo40YlQ4Gcaipa/9IZO5Otlcv5GJSACOeByUxWDtISCo2N85ujr1rg2Dt2F4hPmLDH3GFtkDs7PN51yQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787034397; c=relaxed/simple;
	bh=CdZWVE2aVxvvoMcSS/wkYxHqnEorhORvC+axj36DENI=;
	h=Date:From:To:Cc:Subject:Content-Type:MIME-Version:Message-ID; b=Hb6Me4oUrkKRDE29qTIJfC4gZCl+TCcte/Qhi9JSAVgVmDk54ZC6fTqd+zoYZCmxCpscBGv5v49pa7DfrsZdERC/htntczHPiJzMb5XIn6vKt+O2Wj8hpouMDvTtzUu5zcZV5+JL86LAw175Dqkx2A4/R3TK4PQELdqVrw0fy74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn; spf=pass smtp.mailfrom=zju.edu.cn; arc=none smtp.client-ip=4.193.249.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zju.edu.cn
Received: from zju.edu.cn (unknown [10.190.164.155])
	by mtasvr (Coremail) with SMTP id _____wAnIH8G+4Nq7YGiAA--.26113S3;
	Tue, 18 Aug 2026 14:26:15 +0800 (CST)
Received: from stitch$zju.edu.cn ( [10.190.164.155] ) by
 ajax-webmail-mail-app2 (Coremail) ; Tue, 18 Aug 2026 14:26:14 +0800
 (GMT+08:00)
Date: Tue, 18 Aug 2026 14:26:14 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: "Jiacheng Xu" <stitch@zju.edu.cn>
To: gregkh@linuxfoundation.org, rafael@kernel.org, dakr@kernel.org
Cc: akpm@linux-foundation.org, driver-core@lists.linux.dev
Subject:  [PATCH] kobject: fix out-of-bounds read in action parser
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2025.3-cmXT6 build
 20260617(6f868824) Copyright (c) 2002-2026 www.mailtech.cn zju.edu.cn
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-ID: <200d27f7.1471a.1a0138c92da.Coremail.stitch@zju.edu.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:zC_KCgBXx8wG+4NqrzL4Aw--.20459W
X-CM-SenderInfo: qtrxiiaqttimo62m3hxhgxhubq/1tbiAwYHC2qDvBYE7wAAsh
X-CM-DELIVERINFO: =?B?iDRwTAXKKxbFmtjJiESix3B1w3tMoM3snk/k5SVzZVydjEqe1eefKHnLf95EnB4iem
	egW8+OhS+QO2dYbxzcbMJOVXcAY3kqnHhljA8Eppavh2t+C6uslOxD+Qqp5wuj0SqU3qDI
	HhY2dyABfiB15EYgC/Q1Md2LXB9jSIi815nA/5O1IkFdfSebY+rAK0eGGfowhg==
X-Coremail-Antispam: 1Uk129KBj93XoW7Zr4xKryxJF1ftw48Aw4xAFc_yoW8Gw4Dpr
	sI9w13tr95Jw47GwsxtaykWFW7Za1kAr1UJF909wnIkw4Y9wnYgF1DKr1UZr13GF95Ar1Y
	q3WUKwn09ayDZFXCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUPGb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AK
	xVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc
	02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAF
	wI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0Y48IcxkI7V
	AKI48G6xCjnVAKz4kxM4xvF2IEb7IF0Fy264kE64k0F24lFcxC0VAYjxAxZF0Ex2IqxwCF
	04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r
	18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vI
	r41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr
	1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvE
	x4A2jsIEc7CjxVAFwI0_Jr0_Gr1l6VACY4xI67k04243AbIYCTnIWIevJa73UjIFyTuYvj
	xU2_HjUUUUU

a29iamVjdF9hY3Rpb25fdHlwZSgpIHVzZXMgdGhlIHBvc2l0aW9uIG9mIHRoZSBmaXJzdCBzcGFj
ZSBpbiB0aGUgaW5wdXQKYXMgdGhlIGxlbmd0aCBvZiB0aGUgdWV2ZW50IGFjdGlvbi4gIEl0IHRo
ZW4gY2hlY2tzIHRoZSBieXRlIGF0IHRoYXQKcG9zaXRpb24gaW4gdGhlIGNvcnJlc3BvbmRpbmcg
YWN0aW9uIHN0cmluZy4KCkFuIGVtYmVkZGVkIE5VTCBieXRlIGNhbiBtYWtlIHN0cm5jbXAoKSBy
ZXBvcnQgYSBtYXRjaCB3aGlsZQpjb3VudF9maXJzdCBpcyBhbHJlYWR5IGdyZWF0ZXIgdGhhbiB0
aGUgYWN0dWFsIGxlbmd0aCBvZiB0aGUgYWN0aW9uCnN0cmluZy4gIEZvciBleGFtcGxlLCB0aGUg
aW5wdXQgImJpbmRcMCAuLi4iIG1ha2VzIHRoZSBwYXJzZXIgYWNjZXNzCmtvYmplY3RfYWN0aW9u
c1tLT0JKX0JJTkRdWzVdLCB3aGljaCBpcyBiZXlvbmQgdGhlIGVuZCBvZiB0aGUgImJpbmQiCnN0
cmluZy4KClVzZSBzdHJsZW4oKSB0byB2ZXJpZnkgdGhhdCB0aGUgaW5wdXQgYWN0aW9uIGxlbmd0
aCBleGFjdGx5IG1hdGNoZXMgdGhlCmtub3duIGFjdGlvbiBzdHJpbmcgYmVmb3JlIGFjY2VwdGlu
ZyB0aGUgbWF0Y2guICBUaGlzIGF2b2lkcyBpbmRleGluZwp0aGUgYWN0aW9uIHN0cmluZyB3aXRo
IGFuIG91dC1vZi1ib3VuZHMgb2Zmc2V0LgoKRml4ZXM6IGYzNjc3NmZhZmJhYSAoImtvYmplY3Q6
IHN1cHBvcnQgcGFzc2luZyBpbiB2YXJpYWJsZXMgZm9yIHN5bnRoZXRpYyB1ZXZlbnRzIikKU2ln
bmVkLW9mZi1ieTogSmlhY2hlbmcgWHUgPHN0aXRjaEB6anUuZWR1LmNuPgotLS0KbGliL2tvYmpl
Y3RfdWV2ZW50LmMgfCAyICstCjEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxl
dGlvbigtKQoKZGlmZiAtLWdpdCBhL2xpYi9rb2JqZWN0X3VldmVudC5jIGIvbGliL2tvYmplY3Rf
dWV2ZW50LmMKaW5kZXggZGRiYzRkNzQ4MmQyLi5iMDM1NjIzMDFiZmUgMTAwNjQ0Ci0tLSBhL2xp
Yi9rb2JqZWN0X3VldmVudC5jCisrKyBiL2xpYi9rb2JqZWN0X3VldmVudC5jCkBAIC04Myw3ICs4
Myw3IEBAIHN0YXRpYyBpbnQga29iamVjdF9hY3Rpb25fdHlwZShjb25zdCBjaGFyICpidWYsIHNp
emVfdCBjb3VudCwKZm9yIChhY3Rpb24gPSAwOyBhY3Rpb24gPCBBUlJBWV9TSVpFKGtvYmplY3Rf
YWN0aW9ucyk7IGFjdGlvbisrKSB7CiAgICAgICAgaWYgKHN0cm5jbXAoa29iamVjdF9hY3Rpb25z
W2FjdGlvbl0sIGJ1ZiwgY291bnRfZmlyc3QpICE9IDApCiAgICAgICAgICAgICAgICBjb250aW51
ZTsKLSAgICAgICAgICAgICBpZiAoa29iamVjdF9hY3Rpb25zW2FjdGlvbl1bY291bnRfZmlyc3Rd
ICE9ICdcMCcpCisgICAgICAgICAgICAgaWYgKHN0cmxlbihrb2JqZWN0X2FjdGlvbnNbYWN0aW9u
XSkgIT0gY291bnRfZmlyc3QpCiAgICAgICAgICAgICAgICBjb250aW51ZTsKICAgICAgICBpZiAo
YXJncykKICAgICAgICAgICAgICAgICphcmdzID0gYXJnc19zdGFydDsK

