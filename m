Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=216.40.44.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793896044;
	b=e5VqIJ9QN1Xw64xE8su8USO7hHF2KqwiAsB7i8hauHHCW+pde7RcafAdqq3xjFVISZsT
	 1lnJPy57ioMxsqtrEE5Yw9F0TQO8iWf2odXMfg4mjWbJ/72yPDfaZXcPIbTblUZQmxUF6
	 wIT6jTgsb17zn/dmScz4gMo73MA5YQBCUPIe4nVhfAEYuqR9vWR7qgHDXqCH4cbQPCPuJ
	 6h+m5whoQyOGMRfCo9u/mIKju9eB3CpLTFctBCnVohRwuNMflG172r4GMnjZ23isytVov
	 W4OlxXn7UxzoZhwdLhL/2pSLsZdxQS56hypoiPDQgACxVo3XB3x8AO4DEbPAubOfdgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793896044;
	h=DMARC-Filter:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Rspamd-Server:X-Rspamd-Queue-Id:
	 X-Stat-Signature:X-Spam-Status:X-Session-Marker:X-Session-ID:
	 DKIM-Signature:X-HE-Tag:X-HE-Meta;
	bh=cl6qWXAwKxsVwTkKY8JXxlaaCkzuu5lHBNqnNBZkMHw=;
	b=tAQDgKa3hDcKjQ+MYvrJt5/jkU1lGqfw8LbGJSd8r9gepucsJzJ05Pq7O9pgmBx0MowQ
	 u9Sb6glwYyMN+h9Qcld0JZKjQ6/HlNrKBxtk8T3eS0oLdFQJJs37Dsc0ToNO3njSLl0PM
	 MUeBErALZFcGVm/gAgQqpEXnXQ6bNX4Y4cz3+lyjn9WuB9LJbHU/0fmsJ11L0htFAXAaE
	 z06dIKNy5TU41dYihazaKxaGv6ozhffKgw0NGIRemHawCDIA4yxC7iT+7oRr4co20OG3z
	 cJbenRChJxHiOlecDco/RrW7L7phnt6GrMid63Hrgw/4fPUSqYBVjq9n9fkqt3jyqCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=goodmis.org;
	spf=pass smtp.mailfrom=goodmis.org;
	dkim=pass header.d=goodmis.org header.i=@goodmis.org header.a=rsa-sha256 header.s=dkim1 header.b=isGRszzZ;
	arc=none smtp.remote-ip=216.40.44.12
Received: from relay.hostedemail.com (smtprelay0012.hostedemail.com [216.40.44.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6682606D832
	for <driver-core@lists.linux.dev>; Thu,  5 Nov 2026 16:27:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6682606D832
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=goodmis.org header.i=@goodmis.org header.a=rsa-sha256 header.s=dkim1 header.b=isGRszzZ
Received: from omf11.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay03.hostedemail.com (Postfix) with ESMTP id EF57EA0B2C;
	Thu,  5 Nov 2026 16:27:14 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf11.hostedemail.com (Postfix) with ESMTPA id E897F2002D;
	Thu,  5 Nov 2026 16:27:08 +0000 (UTC)
Date: Thu, 5 Nov 2026 11:27:07 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Alejandro Colomar <alx+linux-hardening@kernel.org>, Bartosz Golaszewski
 <brgl@kernel.org>, Alejandro Colomar <alx@kernel.org>,
 linux-hardening@vger.kernel.org, Andreas Schwab <schwab@linux-m68k.org>,
 Andy Shevchenko <andy@kernel.org>, Daniel Scally <djrscally@gmail.com>,
 Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, Joe Perches
 <joe@perches.com>, Johan Hovold <johan@kernel.org>, Kees Cook
 <kees@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Len Brown <lenb@kernel.org>, Linus Torvalds
 <torvalds@linux-foundation.org>, Linus Walleij <linusw@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Rob Herring <robh@kernel.org>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, Saravana Kannan <saravanak@kernel.org>, Tom
 Zanussi <zanussi@kernel.org>, linux-acpi@vger.kernel.org,
 driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 0/2] Add strprefix() and fix a bug with it
Message-ID: <20261105112707.3e523564@gandalf.local.home>
In-Reply-To: <5001d8c2-2334-48bd-bc95-6b33e3922a46@kernel.org>
References: <cover.1793876837.git.alx@kernel.org>
	<cover.1793882260.git.alx@kernel.org>
	<qwpovcqznx6eltou4inmj3v62qhh6ouvihqnze7bobnd7lmcbw@rcri4e623icb>
	<auyOkL1Vb1iKicS9@devuan>
	<5001d8c2-2334-48bd-bc95-6b33e3922a46@kernel.org>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: rspamout03
X-Rspamd-Queue-Id: E897F2002D
X-Stat-Signature: 1j5wr87cyuobkeessu4smpn1kt6uqm7y
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX18LWE+TJn1V15fX2nd3ghD2tOKUsGtbMPo=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=goodmis.org; h=date:from:to:cc:subject:message-id:in-reply-to:references:mime-version:content-type:content-transfer-encoding; s=dkim1; bh=cl6qWXAwKxsVwTkKY8JXxlaaCkzuu5lHBNqnNBZkMHw=; b=isGRszzZS5nfoejHUDzDLGhTBvLgv90g+WAVgonIoqoULmQosElt/YkkmtZCG/er4K4ZDKb0kvSLTzAeUcyaUu4POFEAYxPTS6kMiAlaGQ3/+yVTsb3rWeyefPXmtiZk3db+mHiAByy9IyaKv9Iky/h8qdJfJcl9UUIXaMNjsIE=
X-HE-Tag: 1793896028-287696
X-HE-Meta: U2FsdGVkX18/tmyfkjZHklw+whjWpw3EGPMbFU48rlVLVJORRKfHV20NxtljGLQ4CE8FlNIE1rUiJxJvhAu9wOEnwcNS7/wSWe42xYAVcG8z7ibSqnS3xC+4OEBmRMkEbT/1aHTTHx54xVL22ry2Y9Hi9Lc0tUuU/U096RSJ21Toj9fJN+ji6hTb6eCaoPkSDrj4n5cZm0JsW/A+rUK4rVjEJ6TqGN/yiIrtPfWVdgyekmXHJaqJalSxYxmHSQ+wC5gwzDcaKumA6i9rN4JpSe+JmQ5GvXGWboNIwn7a1LhGzSZvw5btCmyVvyIR1WY2MQV515HGAy7ca34d9q8hFBfjSl485DUR

On Thu, 5 Nov 2026 16:21:02 +0100
Krzysztof Kozlowski <krzk@kernel.org> wrote:

> I believe there should be no excuse for modern maintainer to not use b4
> in the workflow. The same BTW for submitters of anything bigger than
> 3-patch series.

I still don't use it ;-)

That's because I have been perfectly happy with patchwork, which is where I
download my patches from.

-- Steve
