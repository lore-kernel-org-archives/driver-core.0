Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AD7C2773CA;
	Sat, 11 Jul 2026 23:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783814238; cv=none; b=Idrz73HkWTYj36qAo+q0c5w9LLy1psvvagQuJJv+SdRruY+LwgodUGjUcdoEE2hTmXstgzPU2HlVNs3qSwVi7/kVaFLVrdZ70UGTxDHm8Hss4ukLfnB/TcGmBANQCDV0UK6AHoauKVxUneCwikNQ7QIe+DqjlnEU3GVlnUOiHS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783814238; c=relaxed/simple;
	bh=PEUL4KnPkd6uKkC0JahMzCQNQcWKZYGa26Mamsuu7Fw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=VT/t7yxw1Hr8/DN25hPXZQEnRZVHrpQO+jRVGpqujZdZ8gI36O2OEPsFhwfzkpV00Deo1bX4n2+pAvS5iN924ciqLdEdRPWY8AH4i7TT7Gl7ZXYNZTBqMe5j8iHnz+aK9PBJzHHrLGh6qI/e8gWjRtWpTQJIYMB5BhVTLB8darU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bkk3b22q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bkk3b22q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D916D1F000E9;
	Sat, 11 Jul 2026 23:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783814237;
	bh=PEUL4KnPkd6uKkC0JahMzCQNQcWKZYGa26Mamsuu7Fw=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=Bkk3b22qAkfZXUec70O2/3uqr6UdamInU6/ubFun1b4eJ9OsbDm3JTO/MAPexbgQD
	 2rU7VAuXX0byw2tDQE0KFQ9A5Mm+0PIEsFq99KjXjXzwkJlrqPcRhy9FXsQLBhUEbX
	 L2yP3swQxfCzQRqA5HOygxzUkNLHm3N0oueRoP6Geo6mVncZp+88ZsAhXJFdAGu6dR
	 JT0lGeJdjVQN6PHUMWnE6swXs8KBI8nTj9/1RnUs164EwS5hqcoapyAzShLef1+7AJ
	 tWKTCKMk+j5fSRZPuT5cA52fFeC2+VTMajDvR2EmydlSzfc98QOhavY7gyGXk2QlZb
	 Mw4AfDZSC9Raw==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 12 Jul 2026 01:57:15 +0200
Message-Id: <DJW5DESRJNN0.1FN6A3Q8N1P0P@kernel.org>
Subject: Re: [PATCH 1/2] firmware_loader: builtin: ignore 0-size firmware
Cc: "Luis Chamberlain" <mcgrof@kernel.org>, "Russ Weight"
 <russ.weight@linux.dev>, <driver-core@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
To: "Dmitry Torokhov" <dmitry.torokhov@gmail.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260426043041.649202-1-dmitry.torokhov@gmail.com>
 <alK_lhT0HOI7LXKT@google.com>
In-Reply-To: <alK_lhT0HOI7LXKT@google.com>

On Sun Jul 12, 2026 at 12:11 AM CEST, Dmitry Torokhov wrote:
> Gentle ping on this and the next one...

Sorry for the delay, I picked this one up, but I have a question on the sec=
ond
one.
