Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793843316;
	b=pk2Qngd/DYdMLsDK8PzabQ1YX3e0/9pJ4cediWNHBnnV4NpHP0caphgiQVLmj2CZ0rMj
	 3BHmL0br32YB7D3ac9TwaB8fOO9Ir2IJ6f6jaWnx9zmXOrx1Dx5FUKZJ/AsVUQMJuoz5Z
	 jeWr6ekjNHnuu6ni4/hqUmB4HdnxuFkrDv1pP8b1drnfGXQE2b1uzKrsXQJ1JbM9ZpkhI
	 VHI33lHkV00xU5df/J+Zv2ip/siCFPcGhekBKNg/uMI3y7GiC1Uz87WMIQkjMXaT6Mz12
	 0QCFzrTmFc2JM3WbwDttIl5/jXyDFLsDjmFkSZw0pIJa7AO6OMFilvA0JtBP0vhvlqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793843316;
	h=Received:DKIM-Signature:Mime-Version:Content-Transfer-Encoding:
	 Content-Type:Date:Message-Id:From:Subject:Cc:To:References:
	 In-Reply-To;
	bh=9vvDZpN7FpoRVw1aQmaxfyTaMcpHriKPFg+a1zP/OAA=;
	b=FkgZRWy7iv8Crq//yaVlhw7tAooZq70AW1rdNgK/0mS/LWjCcpEEeXgKM0+2zyGEdi5j
	 gOzg9DWtioQTIuz3vtHVyv5TiKvws42bBxiuHkZLhyddKFMXKKHsQ6DKC5jxSaQ17L2BM
	 IxPC1pYlVLV9CMQYMJ8ZhhrmI8hW27E35Gs+vxwi0FmIgUdoj6cabe2RdLzRvv+rjCpme
	 61cGTFwD+xidBarAWd3qo8bF7IgE/vZ9B6ABz75scsRf9ugZ/FjdCKOPs44lF4F/0+Wmc
	 mchxjXH8bNmsgkX2o0oPVzDopfwrFNQiPH/+M9ajl9NvHJZ2QiIQPoxyZILK6rz0GJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TMfCl4kP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18213606A329;
	Thu,  5 Nov 2026 01:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TMfCl4kP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F5D61F00919;
	Thu,  5 Nov 2026 01:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793843315;
	bh=9vvDZpN7FpoRVw1aQmaxfyTaMcpHriKPFg+a1zP/OAA=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To;
	b=TMfCl4kPtncdHPI1OeaHlYAMmJLRskwd+hwH1Blq5cEGCVA8tGKpKPqPvsCa7CfvO
	 sReQlNksmv4nQM17myZJ/JqX7GOnXjT9C/LC7TtjPFKN0uztCbpGpZKS1sbHAE3OTE
	 5wb4Ws0h+5Sco4GndgZmiAsYLxe4a2sAppSfPjpIA5ZiVMyNoPjJ20Z4WCFaZMaNxl
	 JYyeYlmBAYmQGbTbSwUskdzdTZkJSnpcy1oW+xhaxJCWM3n+3PMI3UflNa/eBBDsrL
	 yfDauqWwEvCV9wxELjPKdJGEAgzGmnrC76pcsNVfQ8emGRZXzHGD/35B5Yaek1kKbJ
	 LP/gaeCCr/vrg==
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Nov 2026 02:48:33 +0100
Message-Id: <DMMWDTG48CAN.LHRVFXXDY5YV@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH] driver core: fix race between bus_remove_driver() and
 dev_driver_uevent()
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Masami Hiramatsu (Google)" <mhiramat@kernel.org>,
 <driver-core@lists.linux.dev>, <linux-kernel@vger.kernel.org>
To: "Dmitry Torokhov" <dmitry.torokhov@gmail.com>
References: <as71DkwHeLGNDsPv@google.com>
 <2026101444-unnoticed-caliber-21d5@gregkh> <as8dAu4R99pP1GHD@google.com>
 <2026101409-unkind-ablaze-08a3@gregkh>
 <21f4cbf39c7872893f8f2d3bfde7d829@gmail.com>
In-Reply-To: <21f4cbf39c7872893f8f2d3bfde7d829@gmail.com>

On Thu Nov 5, 2026 at 2:21 AM CET, Dmitry Torokhov wrote:
> Just a gentle ping on this patch. Could it be picked up, or would you
> prefer a plain spin_lock()/spin_unlock() pair instead of the empty
> scoped_guard() block?

Personally I like the scoped_guard(), but to me either is fine.

But I'd consider updating the comment above dev_driver_uevent() accordingly=
,
e.g.:

diff --git a/drivers/base/core.c b/drivers/base/core.c
index cbe05197d4a0..cc6a1016c251 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -2705,9 +2705,12 @@ static const char *dev_uevent_name(const struct kobj=
ect *kobj)
  * risky as driver pointer is transitioning to NULL, so READ_ONCE() should
  * be used to make sure we are dealing with the same pointer, and to
  * ensure that driver structure is not going to disappear from under us
- * we take bus' drivers klist lock. The assumption that only registered
- * driver can be bound to a device, and to unregister a driver bus code
- * will take the same lock.
+ * we take the bus' drivers klist lock. During driver unregistration,
+ * bus_remove_driver() acquires and releases this lock after detaching
+ * all devices and clearing their driver pointers. This waits for readers
+ * that observed the old pointer to finish accessing the driver name
+ * before the driver can be freed. Readers acquiring the lock afterward
+ * cannot observe the removed driver.
  */
 static void dev_driver_uevent(const struct device *dev, struct kobj_uevent=
_env *env)
 {
